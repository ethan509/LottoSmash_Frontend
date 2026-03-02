import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../data/models/stats_models.dart';
import '../../providers/stats_provider.dart';
import '../widgets/hot_cold_indicator.dart';
import '../widgets/probability_bar.dart';

class BayesianScreen extends ConsumerStatefulWidget {
  const BayesianScreen({super.key});

  @override
  ConsumerState<BayesianScreen> createState() => _BayesianScreenState();
}

class _BayesianScreenState extends ConsumerState<BayesianScreen> {
  int _window = 50;

  @override
  Widget build(BuildContext context) {
    final statsAsync = ref.watch(bayesianStatsProvider(_window));

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.bayesianAnalysis),
      ),
      body: statsAsync.when(
        loading: () => const ShimmerList(itemCount: 4, itemHeight: 100),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(bayesianStatsProvider(_window)),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async =>
              ref.invalidate(bayesianStatsProvider(_window)),
          child: _BayesianContent(
            data: data,
            window: _window,
            onWindowChanged: (w) => setState(() => _window = w),
          ),
        ),
      ),
    );
  }
}

class _BayesianContent extends StatelessWidget {
  final BayesianResponse data;
  final int window;
  final ValueChanged<int> onWindowChanged;

  const _BayesianContent({
    required this.data,
    required this.window,
    required this.onWindowChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Window 선택
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '분석 범위',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SegmentedButton<int>(
                    segments: const [
                      ButtonSegment(value: 20, label: Text('최근 20회')),
                      ButtonSegment(value: 50, label: Text('최근 50회')),
                      ButtonSegment(value: 100, label: Text('최근 100회')),
                    ],
                    selected: {window},
                    onSelectionChanged: (s) => onWindowChanged(s.first),
                    showSelectedIcon: false,
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // HOT 번호
          _NumberSection(
            title: AppStrings.hotNumbers,
            color: AppColors.hotColor,
            numbers: data.hotNumbers,
            theme: theme,
          ),
          const SizedBox(height: 16),

          // COLD 번호
          _NumberSection(
            title: AppStrings.coldNumbers,
            color: AppColors.coldColor,
            numbers: data.coldNumbers,
            theme: theme,
          ),
          const SizedBox(height: 16),

          // 전체 번호 posterior 순위
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '전체 번호 확률 (posterior)',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '최근 ${data.windowSize}회 기준 | 총 ${data.totalDraws}회',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._buildNumberList(
                    List<BayesianNumber>.from(data.numbers)
                      ..sort(
                          (a, b) => b.posterior.compareTo(a.posterior)),
                    theme,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNumberList(
      List<BayesianNumber> numbers, ThemeData theme) {
    final maxPosterior =
        numbers.fold<double>(0, (m, n) => n.posterior > m ? n.posterior : m);

    return numbers.map((n) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            LottoBall(number: n.number, size: 30),
            const SizedBox(width: 8),
            HotColdIndicator(status: n.status),
            const SizedBox(width: 8),
            Expanded(
              child: ProbabilityBar(
                probability: maxPosterior > 0
                    ? n.posterior / maxPosterior
                    : 0,
                color: _statusColor(n.status),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 52,
              child: Text(
                '${(n.posterior * 100).toStringAsFixed(2)}%',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Color _statusColor(String status) {
    switch (status.toUpperCase()) {
      case 'HOT':
        return AppColors.hotColor;
      case 'COLD':
        return AppColors.coldColor;
      default:
        return AppColors.neutralColor;
    }
  }
}

class _NumberSection extends StatelessWidget {
  final String title;
  final Color color;
  final List<BayesianNumber> numbers;
  final ThemeData theme;

  const _NumberSection({
    required this.title,
    required this.color,
    required this.numbers,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: numbers.map((n) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LottoBall(number: n.number, size: 36),
                    const SizedBox(height: 4),
                    Text(
                      '${n.recentCount}회',
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
