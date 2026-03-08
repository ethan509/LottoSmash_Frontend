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

class RecommendHistoryScreen extends ConsumerWidget {
  const RecommendHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.recommendHistory)),
      body: userAsync.when(
        loading: () => const ShimmerList(itemCount: 6, itemHeight: 140),
        error: (err, st) => _buildGuestBlock(context),
        data: (user) {
          final isGuest =
              user?.tier?.code == 'GUEST' || user?.email == null;
          return isGuest ? _buildGuestBlock(context) : _buildHistoryBody(ref);
        },
      ),
    );
  }

  Widget _buildHistoryBody(WidgetRef ref) {
    final historyAsync = ref.watch(recommendHistoryProvider);

    return historyAsync.when(
      loading: () => const ShimmerList(itemCount: 6, itemHeight: 140),
      error: (error, _) => AppErrorWidget(
        message: error.toString(),
        onRetry: () => ref.read(recommendHistoryProvider.notifier).refresh(),
      ),
      data: (data) {
        final latestItems = data.latestRound?.items ?? [];
        final winners = data.winners;
        final noPrize = data.noPrize;
        final isEmpty =
            latestItems.isEmpty && winners.isEmpty && noPrize.isEmpty;

        if (isEmpty) return _buildEmptyState(ref);

        return RefreshIndicator(
          onRefresh: () =>
              ref.read(recommendHistoryProvider.notifier).refresh(),
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            children: [
              if (latestItems.isNotEmpty) ...[
                _SectionHeader(
                  label: '최신 추천',
                  drawNo: data.latestRound?.drawNo,
                ),
                ...latestItems.map((item) => _HistoryCard(item: item)),
              ],
              if (winners.isNotEmpty) ...[
                const _SectionHeader(label: '당첨 이력'),
                ...winners.map((item) => _HistoryCard(item: item)),
              ],
              if (noPrize.isNotEmpty) ...[
                const _SectionHeader(label: '꽝 이력'),
                ...noPrize.map((item) => _HistoryCard(item: item)),
              ],
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.history_rounded, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              '아직 추천 이력이 없습니다',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '번호 추천을 받으면 이곳에 자동으로 저장됩니다.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuestBlock(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_outline, size: 64),
            const SizedBox(height: 16),
            const Text(
              '정회원만 이용 가능합니다',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '회원가입 후 추천 이력을 확인할 수 있습니다.',
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
}

class _SectionHeader extends StatelessWidget {
  final String label;
  final int? drawNo;

  const _SectionHeader({required this.label, this.drawNo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: Row(
        children: [
          Text(
            label,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          if (drawNo != null) ...[
            const SizedBox(width: 6),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$drawNo회',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
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
            // 상단: 날짜 + 대상회차 + 당첨배지
            Row(
              children: [
                Text(
                  createdAt,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                if (item.drawNo != null) ...[
                  const SizedBox(width: 6),
                  Text(
                    '${item.drawNo}회',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
                const Spacer(),
                _PrizeRankBadge(prizeRank: item.prizeRank),
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

class _PrizeRankBadge extends StatelessWidget {
  final int? prizeRank;

  const _PrizeRankBadge({required this.prizeRank});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (prizeRank) {
      null => ('대기중', const Color(0xFF9E9E9E)),
      0    => ('꽝',    const Color(0xFFBDBDBD)),
      1    => ('1등 🏆', const Color(0xFFFFB300)),
      2    => ('2등',   const Color(0xFF78909C)),
      3    => ('3등',   const Color(0xFFFF7043)),
      4    => ('4등',   const Color(0xFF42A5F5)),
      5    => ('5등',   const Color(0xFF66BB6A)),
      _    => ('$prizeRank등', const Color(0xFF9E9E9E)),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: prizeRank == null ? 0.12 : 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: prizeRank == null
              ? const Color(0xFF9E9E9E)
              : (prizeRank == 0 ? const Color(0xFF9E9E9E) : color),
        ),
      ),
    );
  }
}
