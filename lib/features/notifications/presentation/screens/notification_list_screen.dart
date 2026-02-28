import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../data/models/notification_models.dart';
import '../../providers/notification_provider.dart';

class NotificationListScreen extends ConsumerStatefulWidget {
  /// 0: 알림 탭, 1: 당첨 확인 탭 (FCM 라우팅 시 1로 설정)
  final int initialTab;

  const NotificationListScreen({super.key, this.initialTab = 0});

  @override
  ConsumerState<NotificationListScreen> createState() =>
      _NotificationListScreenState();
}

class _NotificationListScreenState
    extends ConsumerState<NotificationListScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab.clamp(0, 1),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.notifications),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '알림'),
            Tab(text: '당첨 확인'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _NotificationTab(),
          _WinningTab(),
        ],
      ),
    );
  }
}

class _NotificationTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationListProvider);

    return notificationsAsync.when(
      loading: () => const ShimmerList(itemCount: 5, itemHeight: 80),
      error: (error, _) => AppErrorWidget(
        message: error.toString(),
        onRetry: () => ref.invalidate(notificationListProvider),
      ),
      data: (data) {
        if (data.notifications.isEmpty) {
          return const EmptyStateWidget(
            icon: Icons.notifications_none,
            message: '알림이 없습니다',
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(notificationListProvider),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: data.notifications.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _NotificationCard(
                notification: data.notifications[index],
              );
            },
          ),
        );
      },
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final AppNotification notification;

  const _NotificationCard({required this.notification});

  IconData get _icon {
    switch (notification.type) {
      case 'winning':
        return Icons.emoji_events;
      case 'draw':
        return Icons.confirmation_number;
      default:
        return Icons.notifications;
    }
  }

  Color _iconColor(BuildContext context) {
    switch (notification.type) {
      case 'winning':
        return Colors.amber;
      case 'draw':
        return Theme.of(context).colorScheme.primary;
      default:
        return Theme.of(context).colorScheme.onSurfaceVariant;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _iconColor(context).withAlpha(30),
          child: Icon(_icon, color: _iconColor(context)),
        ),
        title: Text(
          notification.title,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.body),
            const SizedBox(height: 4),
            Text(
              notification.createdAt.split('T')[0],
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

class _WinningTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final winningsAsync = ref.watch(winningListProvider);

    return winningsAsync.when(
      loading: () => const ShimmerList(itemCount: 3, itemHeight: 120),
      error: (error, _) => AppErrorWidget(
        message: error.toString(),
        onRetry: () => ref.invalidate(winningListProvider),
      ),
      data: (data) {
        if (data.winnings.isEmpty) {
          return const EmptyStateWidget(
            icon: Icons.emoji_events_outlined,
            message: '당첨 내역이 없습니다',
          );
        }
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(winningListProvider),
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: data.winnings.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _WinningCard(winning: data.winnings[index]);
            },
          ),
        );
      },
    );
  }
}

class _WinningCard extends StatelessWidget {
  final WinningResult winning;

  const _WinningCard({required this.winning});

  String get _rankText {
    if (winning.prizeRank == null) return '미당첨';
    return '${winning.prizeRank}등';
  }

  Color _rankColor(BuildContext context) {
    switch (winning.prizeRank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.blueGrey;
      case 3:
        return Colors.brown;
      case 4:
      case 5:
        return Theme.of(context).colorScheme.primary;
      default:
        return Theme.of(context).colorScheme.onSurfaceVariant;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${winning.drawNo}회',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: _rankColor(context).withAlpha(30),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _rankText,
                    style: TextStyle(
                      color: _rankColor(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '매칭된 번호 (${winning.matchedCount}개)',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            LottoBallRow(
              numbers: winning.matchedNumbers,
              ballSize: 36,
              spacing: 4,
            ),
            if (winning.bonusMatched) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    '보너스 번호 일치',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.amber,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
