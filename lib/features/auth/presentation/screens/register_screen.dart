import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/services/fcm_service.dart';
import '../../../../core/utils/validators.dart';
import '../../data/models/auth_models.dart';
import '../../data/repositories/auth_repository.dart';
import '../../providers/auth_provider.dart';

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
  DateTime? _selectedBirthDate;

  // Step 4: 선택 프로필
  final _regionController = TextEditingController();
  final _nicknameController = TextEditingController();
  String? _selectedFrequency;

  static const _genderOptions = [
    ('M', AppStrings.genderMale),
    ('F', AppStrings.genderFemale),
    ('O', AppStrings.genderOther),
  ];

  static const _frequencyOptions = [
    ('WEEKLY', AppStrings.frequencyWeekly),
    ('MONTHLY', AppStrings.frequencyMonthly),
    ('BIMONTHLY', AppStrings.frequencyBimonthly),
    ('IRREGULAR', AppStrings.frequencyIrregular),
  ];

  @override
  void dispose() {
    _codeTimer?.cancel();
    _emailController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _regionController.dispose();
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

  Future<void> _handleRegister() async {
    if (!_formKeys[3].currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final request = RegisterRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        code: _codeController.text.trim(),
        gender: _selectedGender!,
        birthDate: _selectedBirthDate!.toIso8601String().split('T')[0],
        region: _regionController.text.trim().isNotEmpty
            ? _regionController.text.trim()
            : null,
        nickname: _nicknameController.text.trim().isNotEmpty
            ? _nicknameController.text.trim()
            : null,
        purchaseFrequency: _selectedFrequency,
      );

      await ref.read(authStateNotifierProvider.notifier).register(request);
      try {
        await ref.read(fcmServiceProvider).initialize();
      } catch (_) {}
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('회원가입이 완료되었습니다!')),
        );
        context.go('/home');
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
        if (_selectedBirthDate == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('생년월일을 선택해주세요')),
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

            // 생년월일
            Text(
              AppStrings.birthDate,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: _isLoading ? null : _pickBirthDate,
              child: InputDecorator(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                ),
                child: Text(
                  _selectedBirthDate != null
                      ? '${_selectedBirthDate!.year}.${_selectedBirthDate!.month.toString().padLeft(2, '0')}.${_selectedBirthDate!.day.toString().padLeft(2, '0')}'
                      : '생년월일을 선택해주세요',
                  style: TextStyle(
                    color: _selectedBirthDate != null
                        ? null
                        : Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
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
            TextFormField(
              controller: _regionController,
              decoration: const InputDecoration(
                labelText: AppStrings.region,
                prefixIcon: Icon(Icons.location_on_outlined),
                hintText: '예: 서울',
              ),
              enabled: !_isLoading,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nicknameController,
              decoration: const InputDecoration(
                labelText: AppStrings.nickname,
                prefixIcon: Icon(Icons.badge_outlined),
                hintText: '최대 20자',
              ),
              maxLength: 20,
              validator: Validators.validateNickname,
              enabled: !_isLoading,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _selectedFrequency,
              decoration: const InputDecoration(
                labelText: AppStrings.purchaseFrequency,
                prefixIcon: Icon(Icons.shopping_cart_outlined),
              ),
              items: _frequencyOptions.map((option) {
                final (code, label) = option;
                return DropdownMenuItem(value: code, child: Text(label));
              }).toList(),
              onChanged:
                  _isLoading ? null : (value) => setState(() => _selectedFrequency = value),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedBirthDate ?? DateTime(1990, 1, 1),
      firstDate: DateTime(1900),
      lastDate: now,
      locale: const Locale('ko', 'KR'),
    );
    if (picked != null) {
      setState(() => _selectedBirthDate = picked);
    }
  }
}
