import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';
import '../widgets/probability_bar.dart';

class PairStatsScreen extends ConsumerWidget {
  const PairStatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(pairStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.pairStats),
      ),
      body: statsAsync.when(
        loading: () => const ShimmerList(itemCount: 6, itemHeight: 60),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(pairStatsProvider),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(pairStatsProvider),
          child: _PairContent(data: data),
        ),
      ),
    );
  }
}

class _PairContent extends StatelessWidget {
  final PairStatsResponse data;

  const _PairContent({required this.data});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'TOP ${data.topPairs.length} 쌍'),
              Tab(text: 'BOTTOM ${data.bottomPairs.length} 쌍'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _PairList(
                  pairs: data.topPairs,
                  totalDraws: data.totalDraws,
                ),
                _PairList(
                  pairs: data.bottomPairs,
                  totalDraws: data.totalDraws,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PairList extends StatelessWidget {
  final List<PairStat> pairs;
  final int totalDraws;

  const _PairList({required this.pairs, required this.totalDraws});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxCount =
        pairs.fold<int>(0, (max, p) => p.count > max ? p.count : max);

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: pairs.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final pair = pairs[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  '${index + 1}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 12),
                LottoBall(number: pair.number1, size: 32),
                const SizedBox(width: 6),
                LottoBall(number: pair.number2, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: ProbabilityBar(
                    probability: maxCount > 0
                        ? pair.count / maxCount
                        : 0,
                    label: '${pair.count}회 (${(pair.probability * 100).toStringAsFixed(2)}%)',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
