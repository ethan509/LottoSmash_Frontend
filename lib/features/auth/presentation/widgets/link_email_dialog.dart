import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/utils/validators.dart';
import '../../data/models/auth_models.dart';
import '../../data/repositories/auth_repository.dart';
import '../../providers/auth_provider.dart';

class LinkEmailDialog extends ConsumerStatefulWidget {
  const LinkEmailDialog({super.key});

  @override
  ConsumerState<LinkEmailDialog> createState() => _LinkEmailDialogState();
}

class _LinkEmailDialogState extends ConsumerState<LinkEmailDialog> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _codeSent = false;
  bool _obscurePassword = true;
  Timer? _codeTimer;
  int _remainingSeconds = 0;

  @override
  void dispose() {
    _codeTimer?.cancel();
    _emailController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
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
    if (Validators.validateEmail(email) != null) return;

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

  Future<void> _handleLinkEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      final repo = ref.read(authRepositoryProvider);
      await repo.linkEmail(LinkEmailRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        code: _codeController.text.trim(),
      ));

      ref.invalidate(currentUserProvider);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('이메일이 연동되었습니다')),
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.linkEmail),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: AppStrings.email,
                  prefixIcon: const Icon(Icons.email_outlined),
                  suffixIcon: TextButton(
                    onPressed: _isLoading ? null : _sendCode,
                    child: Text(
                      _codeSent ? '재발송' : '발송',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
                enabled: !_isLoading,
              ),
              if (_codeSent) ...[
                const SizedBox(height: 12),
                TextFormField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    labelText: '인증코드',
                    prefixIcon: const Icon(Icons.pin_outlined),
                    suffixText: _remainingSeconds > 0 ? _timerText : null,
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  validator: Validators.validateVerificationCode,
                  enabled: !_isLoading,
                ),
              ],
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: AppStrings.password,
                  prefixIcon: const Icon(Icons.lock_outlined),
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
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: const Text(AppStrings.cancel),
        ),
        FilledButton(
          onPressed: _isLoading ? null : _handleLinkEmail,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text(AppStrings.confirm),
        ),
      ],
    );
  }
}
