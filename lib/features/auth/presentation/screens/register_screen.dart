import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/services/fcm_service.dart';
import '../../../../core/utils/validators.dart';
import '../../data/models/auth_models.dart';
import '../../data/repositories/auth_repository.dart';
import '../../providers/auth_provider.dart';

/// 생년월일 입력 시 자동으로 YYYY.MM.DD 포맷을 적용하는 TextInputFormatter
class _BirthDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll('.', '');
    if (digits.length > 8) return oldValue;

    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i == 4 || i == 6) buffer.write('.');
      buffer.write(digits[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  int _currentStep = 0;
  bool _isLoading = false;
  bool _codeSent = false;
  Timer? _codeTimer;
  int _remainingSeconds = 0;

  final _formKeys = List.generate(4, (_) => GlobalKey<FormState>());

  // Step 1: 이메일 + 인증코드
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();

  // Step 2: 비밀번호
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  // Step 3: 필수 프로필
  String? _selectedGender;
  final _birthDateController = TextEditingController();

  // Step 4: 선택 프로필
  String? _selectedRegion;
  final _nicknameController = TextEditingController();
  bool _isCheckingNickname = false;
  bool? _nicknameAvailable;

  static const _genderOptions = [
    ('M', AppStrings.genderMale),
    ('F', AppStrings.genderFemale),
    ('O', AppStrings.genderOther),
  ];

  static const _regionOptions = [
    '서울', '부산', '대구', '인천', '광주', '대전', '울산', '세종',
    '경기', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '제주',
  ];

  @override
  void dispose() {
    _codeTimer?.cancel();
    _emailController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _birthDateController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _codeTimer?.cancel();
    setState(() => _remainingSeconds = 180);
    _codeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        return;
      }
      setState(() => _remainingSeconds--);
    });
  }

  String get _timerText {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Future<void> _sendCode() async {
    final email = _emailController.text.trim();
    if (Validators.validateEmail(email) != null) {
      _formKeys[0].currentState?.validate();
      return;
    }

    setState(() => _isLoading = true);
    try {
      final repo = ref.read(authRepositoryProvider);
      await repo.sendCode(email);
      setState(() => _codeSent = true);
      _startTimer();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('인증코드가 발송되었습니다')),
        );
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  /// 생년월일 텍스트(YYYY.MM.DD)를 DateTime으로 파싱
  DateTime? _parseBirthDate() {
    final text = _birthDateController.text.trim();
    final digits = text.replaceAll('.', '');
    if (digits.length != 8) return null;
    final year = int.tryParse(digits.substring(0, 4));
    final month = int.tryParse(digits.substring(4, 6));
    final day = int.tryParse(digits.substring(6, 8));
    if (year == null || month == null || day == null) return null;
    if (month < 1 || month > 12 || day < 1 || day > 31) return null;
    if (year < 1900 || year > DateTime.now().year) return null;
    try {
      final date = DateTime(year, month, day);
      if (date.isAfter(DateTime.now())) return null;
      return date;
    } catch (_) {
      return null;
    }
  }

  /// 닉네임 중복 체크
  Future<void> _checkNickname() async {
    final nickname = _nicknameController.text.trim();
    if (nickname.isEmpty) return;
    if (Validators.validateNickname(nickname) != null) return;

    setState(() {
      _isCheckingNickname = true;
      _nicknameAvailable = null;
    });
    try {
      final repo = ref.read(authRepositoryProvider);
      final available = await repo.checkNickname(nickname);
      if (mounted) {
        setState(() => _nicknameAvailable = available);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(available ? '사용 가능한 닉네임입니다' : '이미 사용 중인 닉네임입니다'),
            backgroundColor: available ? Colors.green : Colors.red,
          ),
        );
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } finally {
      if (mounted) setState(() => _isCheckingNickname = false);
    }
  }

  Future<void> _handleRegister() async {
    if (!_formKeys[3].currentState!.validate()) return;

    // 닉네임 입력했는데 중복체크 안 한 경우
    final nickname = _nicknameController.text.trim();
    if (nickname.isNotEmpty && _nicknameAvailable == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('닉네임 중복 확인을 해주세요')),
      );
      return;
    }
    if (nickname.isNotEmpty && _nicknameAvailable == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이미 사용 중인 닉네임입니다. 다른 닉네임을 입력해주세요')),
      );
      return;
    }

    final birthDate = _parseBirthDate();

    setState(() => _isLoading = true);
    try {
      final request = RegisterRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        code: _codeController.text.trim(),
        gender: _selectedGender!,
        birthDate: birthDate!.toIso8601String().split('T')[0],
        region: _selectedRegion,
        nickname: nickname.isNotEmpty ? nickname : null,
        purchaseFrequency: null,
        // deviceId는 AuthStateNotifier.register()에서 자동 주입
      );

      // 회원가입 + 자동 로그인 (게스트 → 정회원 업그레이드 포함)
      await ref.read(authStateNotifierProvider.notifier).register(request);
      try {
        await ref.read(fcmServiceProvider).initialize();
      } catch (_) {}
      if (mounted) context.go('/home');
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _onStepContinue() {
    if (_currentStep < 3) {
      // 현재 스텝 유효성 검사
      if (!_formKeys[_currentStep].currentState!.validate()) return;

      // Step 1: 인증코드 미발송 체크
      if (_currentStep == 0 && !_codeSent) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('인증코드를 먼저 발송해주세요')),
        );
        return;
      }

      // Step 3: 성별, 생년월일 체크
      if (_currentStep == 2) {
        if (_selectedGender == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('성별을 선택해주세요')),
          );
          return;
        }
        if (_parseBirthDate() == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('올바른 생년월일을 입력해주세요')),
          );
          return;
        }
      }

      setState(() => _currentStep++);
    } else {
      _handleRegister();
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.register),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: _isLoading ? null : _onStepContinue,
        onStepCancel: _isLoading ? null : _onStepCancel,
        controlsBuilder: (context, details) {
          final isLastStep = _currentStep == 3;
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: _isLoading ? null : details.onStepContinue,
                    child: _isLoading && isLastStep
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(isLastStep
                            ? AppStrings.complete
                            : AppStrings.next),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isLoading ? null : details.onStepCancel,
                    child: Text(
                        _currentStep == 0 ? AppStrings.cancel : AppStrings.previous),
                  ),
                ),
              ],
            ),
          );
        },
        steps: [
          _buildEmailStep(),
          _buildPasswordStep(),
          _buildRequiredProfileStep(),
          _buildOptionalProfileStep(),
        ],
      ),
    );
  }

  Step _buildEmailStep() {
    return Step(
      title: const Text('이메일 인증'),
      isActive: _currentStep >= 0,
      state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      content: Form(
        key: _formKeys[0],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: AppStrings.email,
                prefixIcon: const Icon(Icons.email_outlined),
                suffixIcon: TextButton(
                  onPressed: _isLoading ? null : _sendCode,
                  child: Text(
                    _codeSent ? '재발송' : AppStrings.sendCode,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: Validators.validateEmail,
              enabled: !_isLoading,
            ),
            if (_codeSent) ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(
                  labelText: '인증코드 (6자리)',
                  prefixIcon: const Icon(Icons.pin_outlined),
                  suffixText: _remainingSeconds > 0 ? _timerText : '만료됨',
                  suffixStyle: TextStyle(
                    color: _remainingSeconds > 0
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
                keyboardType: TextInputType.number,
                maxLength: 6,
                validator: Validators.validateVerificationCode,
                enabled: !_isLoading,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Step _buildPasswordStep() {
    return Step(
      title: const Text('비밀번호 설정'),
      isActive: _currentStep >= 1,
      state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      content: Form(
        key: _formKeys[1],
        child: Column(
          children: [
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: AppStrings.password,
                prefixIcon: const Icon(Icons.lock_outlined),
                helperText: '8자 이상 입력해주세요',
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
              obscureText: _obscurePassword,
              validator: Validators.validatePassword,
              enabled: !_isLoading,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: AppStrings.confirmPassword,
                prefixIcon: const Icon(Icons.lock_outlined),
                suffixIcon: IconButton(
                  icon: Icon(_obscureConfirm
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () =>
                      setState(() => _obscureConfirm = !_obscureConfirm),
                ),
              ),
              obscureText: _obscureConfirm,
              validator: (value) => Validators.validateConfirmPassword(
                  value, _passwordController.text),
              enabled: !_isLoading,
            ),
          ],
        ),
      ),
    );
  }

  Step _buildRequiredProfileStep() {
    return Step(
      title: const Text('기본 정보 (필수)'),
      isActive: _currentStep >= 2,
      state: _currentStep > 2 ? StepState.complete : StepState.indexed,
      content: Form(
        key: _formKeys[2],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 성별
            Text(
              AppStrings.gender,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _genderOptions.map((option) {
                final (code, label) = option;
                return ChoiceChip(
                  label: Text(label),
                  selected: _selectedGender == code,
                  onSelected: _isLoading
                      ? null
                      : (selected) {
                          setState(
                              () => _selectedGender = selected ? code : null);
                        },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // 생년월일 - 숫자 입력 → 자동 YYYY.MM.DD 포맷
            TextFormField(
              controller: _birthDateController,
              decoration: const InputDecoration(
                labelText: AppStrings.birthDate,
                prefixIcon: Icon(Icons.calendar_today_outlined),
                hintText: 'YYYY.MM.DD',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                _BirthDateFormatter(),
              ],
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '생년월일을 입력해주세요';
                }
                if (_parseBirthDate() == null) {
                  return '올바른 생년월일을 입력해주세요 (예: 19900115)';
                }
                return null;
              },
              enabled: !_isLoading,
            ),
          ],
        ),
      ),
    );
  }

  Step _buildOptionalProfileStep() {
    return Step(
      title: const Text('추가 정보 (선택)'),
      isActive: _currentStep >= 3,
      state: StepState.indexed,
      content: Form(
        key: _formKeys[3],
        child: Column(
          children: [
            // 거주지역 드롭다운
            DropdownButtonFormField<String>(
              initialValue: _selectedRegion,
              decoration: const InputDecoration(
                labelText: AppStrings.region,
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
              items: _regionOptions.map((region) {
                return DropdownMenuItem(value: region, child: Text(region));
              }).toList(),
              onChanged:
                  _isLoading ? null : (value) => setState(() => _selectedRegion = value),
            ),
            const SizedBox(height: 16),

            // 닉네임 + 중복체크
            TextFormField(
              controller: _nicknameController,
              decoration: InputDecoration(
                labelText: AppStrings.nickname,
                prefixIcon: const Icon(Icons.badge_outlined),
                hintText: '최대 20자',
                suffixIcon: _isCheckingNickname
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : TextButton(
                        onPressed: _nicknameController.text.trim().isEmpty
                            ? null
                            : _checkNickname,
                        child: Text(
                          '중복확인',
                          style: TextStyle(
                            fontSize: 12,
                            color: _nicknameAvailable == true
                                ? Colors.green
                                : null,
                          ),
                        ),
                      ),
              ),
              maxLength: 20,
              validator: Validators.validateNickname,
              onChanged: (_) {
                // 닉네임이 변경되면 중복체크 결과 초기화
                if (_nicknameAvailable != null) {
                  setState(() => _nicknameAvailable = null);
                }
              },
              enabled: !_isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
