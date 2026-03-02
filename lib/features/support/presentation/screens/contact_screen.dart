import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/contact_provider.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _messageCtrl = TextEditingController();

  @override
  void dispose() {
    _messageCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(contactProvider.notifier).send(_messageCtrl.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(contactProvider);
    final theme = Theme.of(context);
    final isSending = status == ContactStatus.sending;

    ref.listen<ContactStatus>(contactProvider, (_, next) {
      if (next == ContactStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('문의가 전송되었습니다. 빠른 시일 내에 답변드리겠습니다.')),
        );
        Navigator.of(context).pop();
      } else if (next == ContactStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('전송에 실패했습니다. 다시 시도해주세요.'),
            backgroundColor: theme.colorScheme.error,
          ),
        );
        ref.read(contactProvider.notifier).reset();
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('개발자에게 문의')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // 안내 카드
            Card(
              color: theme.colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: theme.colorScheme.onSecondaryContainer,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '버그 신고, 기능 제안, 기타 문의 사항을 자유롭게 작성해 주세요.\n'
                        '수신 메일: mauvemove.company@gmail.com',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 메시지 입력
            TextFormField(
              controller: _messageCtrl,
              maxLines: 10,
              maxLength: 2000,
              enabled: !isSending,
              decoration: InputDecoration(
                labelText: '문의 내용',
                hintText: '문의 내용을 입력해주세요.',
                alignLabelWithHint: true,
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: theme.colorScheme.surface,
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return '문의 내용을 입력해주세요.';
                if (v.trim().length < 10) return '10자 이상 입력해주세요.';
                return null;
              },
            ),
            const SizedBox(height: 24),

            // 전송 버튼
            FilledButton.icon(
              onPressed: isSending ? null : _submit,
              icon: isSending
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.send_outlined),
              label: Text(isSending ? '전송 중...' : '문의 전송'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
