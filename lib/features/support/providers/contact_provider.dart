import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/contact_repository.dart';

/// 문의 전송 상태 (idle / sending / success / error)
enum ContactStatus { idle, sending, success, error }

class ContactNotifier extends StateNotifier<ContactStatus> {
  final ContactRepository _repo;

  ContactNotifier(this._repo) : super(ContactStatus.idle);

  Future<void> send(String message) async {
    state = ContactStatus.sending;
    try {
      await _repo.sendContact(message);
      state = ContactStatus.success;
    } catch (_) {
      state = ContactStatus.error;
    }
  }

  void reset() => state = ContactStatus.idle;
}

final contactProvider =
    StateNotifierProvider.autoDispose<ContactNotifier, ContactStatus>((ref) {
  return ContactNotifier(ref.watch(contactRepositoryProvider));
});
