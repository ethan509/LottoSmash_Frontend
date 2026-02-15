import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/notification_models.dart';
import '../data/repositories/notification_repository.dart';

/// 알림 목록
final notificationListProvider =
    FutureProvider<NotificationListResponse>((ref) async {
  final repo = ref.watch(notificationRepositoryProvider);
  return await repo.getNotifications();
});

/// 당첨 확인 목록
final winningListProvider =
    FutureProvider<WinningListResponse>((ref) async {
  final repo = ref.watch(notificationRepositoryProvider);
  return await repo.getWinnings();
});
