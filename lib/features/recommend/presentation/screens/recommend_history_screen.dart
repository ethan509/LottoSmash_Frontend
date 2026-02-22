import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../data/models/recommend_models.dart';
import '../../providers/recommend_provider.dart';

class RecommendHistoryScreen extends ConsumerStatefulWidget {
  const RecommendHistoryScreen({super.key});

  @override
  ConsumerState<RecommendHistoryScreen> createState() =>
      _RecommendHistoryScreenState();
}

class _RecommendHistoryScreenState
    extends ConsumerState<RecommendHistoryScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(recommendHistoryProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.recommendHistory)),
      body: userAsync.when(
        loading: () => const ShimmerList(itemCount: 6, itemHeight: 140),
        error: (err, st) => _buildGuestBlock(context),
        data: (user) {
          final isGuest =
              user?.tier?.code == 'GUEST' || user?.email == null;
          return isGuest ? _buildGuestBlock(context) : _buildHistoryList();
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.history_rounded,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
            ),
            const SizedBox(height: 16),
            Text(
              '아직 추천 이력이 없습니다',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '번호 추천을 받으면 이곳에 자동으로 저장됩니다.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.auto_awesome, size: 18),
              label: const Text('추천 받으러 가기'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestBlock(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lock_outline,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              '정회원만 이용 가능합니다',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '회원가입 후 추천 이력을 확인할 수 있습니다.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => context.go('/register'),
              icon: const Icon(Icons.person_add),
              label: const Text(AppStrings.register),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryList() {
    final historyAsync = ref.watch(recommendHistoryProvider);

    return historyAsync.when(
      loading: () => const ShimmerList(itemCount: 6, itemHeight: 140),
      error: (error, _) => AppErrorWidget(
        message: error.toString(),
        onRetry: () =>
            ref.read(recommendHistoryProvider.notifier).refresh(),
      ),
      data: (state) {
        if (state.items.isEmpty) {
          return _buildEmptyState(context);
        }

        return RefreshIndicator(
          onRefresh: () =>
              ref.read(recommendHistoryProvider.notifier).refresh(),
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            itemCount: state.items.length + (state.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.items.length) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return _HistoryCard(item: state.items[index]);
            },
          ),
        );
      },
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final RecommendationHistory item;

  const _HistoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final createdAt = _formatDate(item.createdAt);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단: 날짜 + 신뢰도
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  createdAt,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${AppStrings.confidence} ${(item.confidence * 100).toStringAsFixed(1)}%',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 번호 공
            Center(
              child: LottoBallRow(
                numbers: item.numbers,
                bonusNumber: item.bonusNumber,
                ballSize: 36,
              ),
            ),
            const SizedBox(height: 12),

            // 하단: 분석/결합 방법
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: [
                ...item.methodCodes.map((code) => Chip(
                      label: Text(code),
                      labelStyle: theme.textTheme.labelSmall,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    )),
                Chip(
                  label: Text(item.combineMethod),
                  labelStyle: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                  backgroundColor: theme.colorScheme.secondaryContainer,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final dt = DateTime.parse(isoDate);
      return '${dt.year}.${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')} ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return isoDate;
    }
  }
}
