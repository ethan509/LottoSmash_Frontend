import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/utils/number_format_utils.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../draws/providers/draw_provider.dart';
import '../../../recommend/data/models/recommend_models.dart';
import '../../../recommend/providers/recommend_provider.dart';
import '../../../recommend/presentation/widgets/method_selector.dart';
import '../../data/models/backtest_models.dart';
import '../../data/repositories/backtest_repository.dart';
import '../../providers/backtest_provider.dart';

// 등수 표시 정보
const _prizeKeys = ['1st', '2nd', '3rd', '4th', '5th', 'none'];
const _prizeLabels = ['1등', '2등', '3등', '4등', '5등', '꽝'];
const _prizeColors = [
  Color(0xFFFFB300), // 금
  Color(0xFF90CAF9), // 은
  Color(0xFFFFAB40), // 동
  Color(0xFF81C784), // 4등
  Color(0xFF4DD0E1), // 5등
  Color(0xFFBDBDBD), // 꽝
];

class BacktestScreen extends ConsumerStatefulWidget {
  const BacktestScreen({super.key});

  @override
  ConsumerState<BacktestScreen> createState() => _BacktestScreenState();
}

class _BacktestScreenState extends ConsumerState<BacktestScreen> {
  final _drawNoController = TextEditingController();
  bool _isRunning = false;

  @override
  void dispose() {
    _drawNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final methodsAsync = ref.watch(analysisMethodsProvider);
    final combineAsync = ref.watch(combineMethodsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('백테스팅'),
      ),
      body: methodsAsync.when(
        loading: () => const ShimmerList(itemCount: 4, itemHeight: 80),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(analysisMethodsProvider),
        ),
        data: (methodsData) => combineAsync.when(
          loading: () => const ShimmerList(itemCount: 4, itemHeight: 80),
          error: (e, _) => AppErrorWidget(
            message: e.toString(),
            onRetry: () => ref.invalidate(combineMethodsProvider),
          ),
          data: (combineData) => _buildContent(
            methodsData.methods,
            combineData.methods,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    List<AnalysisMethod> methods,
    List<CombineMethod> combineMethods,
  ) {
    final selectedCodes = ref.watch(backtestMethodCodesProvider);
    final selectedCombine = ref.watch(backtestCombineMethodProvider);
    final selectedCount = ref.watch(backtestCountProvider);
    final resultAsync = ref.watch(backtestResultProvider);
    final compareList = ref.watch(backtestCompareListProvider);
    final latestDrawNo = ref.watch(latestDrawProvider).valueOrNull?.drawNo;

    final canRun = selectedCodes.isNotEmpty &&
        _drawNoController.text.isNotEmpty &&
        !_isRunning;

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildInfoCard(),
          const SizedBox(height: 16),

          // Step 1: 테스트 회차 입력
          _buildDrawNoInput(latestDrawNo),
          const SizedBox(height: 24),

          // Step 2: 분석 방법 선택
          MethodSelector(
            methods: methods,
            selectedCodes: selectedCodes,
            onChanged: (codes) {
              ref.read(backtestMethodCodesProvider.notifier).state = codes;
            },
          ),
          const SizedBox(height: 24),

          // Step 3: 결합 방법 드롭다운
          _buildCombineDropdown(combineMethods, selectedCombine),
          const SizedBox(height: 24),

          // Step 4: 시뮬레이션 횟수
          _buildCountSelector(selectedCount),
          const SizedBox(height: 24),

          // 실행 버튼
          FilledButton.icon(
            onPressed: canRun ? _runBacktest : null,
            icon: _isRunning
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.science_rounded),
            label: Text(_isRunning ? '시뮬레이션 중...' : '백테스팅 실행'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),

          // 결과
          resultAsync.when(
            data: (result) {
              if (result == null) return const SizedBox.shrink();
              return _BacktestResultCard(
                result: result,
                onAddToCompare: () {
                  final list = ref.read(backtestCompareListProvider);
                  ref.read(backtestCompareListProvider.notifier).state = [
                    ...list,
                    result,
                  ];
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('비교 목록에 추가됐습니다')),
                  );
                },
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, _) {
              final theme = Theme.of(context);
              return Card(
                color: theme.colorScheme.errorContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    error.toString(),
                    style: TextStyle(
                        color: theme.colorScheme.onErrorContainer),
                  ),
                ),
              );
            },
          ),

          // 누적 비교 테이블
          if (compareList.isNotEmpty) ...[
            const SizedBox(height: 24),
            _CompareTable(
              results: compareList,
              onClear: () {
                ref.read(backtestCompareListProvider.notifier).state = [];
              },
            ),
          ],

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      color: colorScheme.primaryContainer.withValues(alpha: 0.5),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(Icons.info_outline_rounded,
                color: colorScheme.primary, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '선택한 분석방법·조합으로 특정 회차를 반복 시뮬레이션해 성능을 비교합니다.\n정회원 이상 전용 기능입니다.',
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: colorScheme.onPrimaryContainer),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCombineDropdown(
      List<CombineMethod> methods, String selectedCode) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '결합 방법',
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedCode,
                items: methods
                    .map((m) => DropdownMenuItem(
                          value: m.code,
                          child: Text(m.name),
                        ))
                    .toList(),
                onChanged: (code) {
                  if (code != null) {
                    ref.read(backtestCombineMethodProvider.notifier).state =
                        code;
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrawNoInput(int? maxDrawNo) {
    final theme = Theme.of(context);
    final rangeText = maxDrawNo != null ? '2 ~ $maxDrawNo회차' : '2회차 이상';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '테스트 회차',
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _drawNoController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: maxDrawNo != null ? '2 ~ $maxDrawNo' : '예: 1100',
            helperText: '입력 가능 범위: $rangeText',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.tag_rounded),
            suffixText: '회차',
          ),
          onChanged: (_) => setState(() {}),
        ),
      ],
    );
  }

  Widget _buildCountSelector(int selectedCount) {
    final theme = Theme.of(context);
    const counts = [10, 20, 100, 1000, 10000];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '시뮬레이션 횟수',
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SegmentedButton<int>(
          segments: counts
              .map((c) => ButtonSegment<int>(
                    value: c,
                    label: Text(_formatCount(c)),
                  ))
              .toList(),
          selected: {selectedCount},
          onSelectionChanged: (set) {
            ref.read(backtestCountProvider.notifier).state = set.first;
          },
          style: SegmentedButton.styleFrom(
            visualDensity: VisualDensity.compact,
          ),
        ),
      ],
    );
  }

  String _formatCount(int c) {
    if (c >= 10000) return '1만';
    if (c >= 1000) return '1천';
    if (c >= 100) return '100';
    if (c >= 20) return '20';
    return '10';
  }

  Future<void> _runBacktest() async {
    final drawNoText = _drawNoController.text.trim();
    final drawNo = int.tryParse(drawNoText);
    if (drawNo == null || drawNo < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('회차는 2 이상의 숫자를 입력하세요')),
      );
      return;
    }

    final methodCodes = ref.read(backtestMethodCodesProvider);
    final combineMethod = ref.read(backtestCombineMethodProvider);
    final count = ref.read(backtestCountProvider);

    final request = BacktestRequest(
      methodCodes: methodCodes,
      combineMethod: combineMethod,
      drawNo: drawNo,
      count: count,
    );

    setState(() => _isRunning = true);
    ref.read(backtestResultProvider.notifier).state = const AsyncLoading();

    try {
      final repo = ref.read(backtestRepositoryProvider);
      final result = await repo.runBacktest(request);
      ref.read(backtestResultProvider.notifier).state = AsyncData(result);
    } on ApiException catch (e) {
      final msg = e.statusCode == 403
          ? '정회원 이상만 이용할 수 있는 기능입니다.'
          : e.message;
      ref.read(backtestResultProvider.notifier).state =
          AsyncError(msg, StackTrace.current);
    } catch (e) {
      ref.read(backtestResultProvider.notifier).state =
          AsyncError(e.toString(), StackTrace.current);
    } finally {
      if (mounted) setState(() => _isRunning = false);
    }
  }
}

// ────────────────────────────────────────────
// 결과 카드 (차트 + 확률 테이블)
// ────────────────────────────────────────────

class _BacktestResultCard extends StatelessWidget {
  final BacktestResult result;
  final VoidCallback onAddToCompare;

  const _BacktestResultCard({
    required this.result,
    required this.onAddToCompare,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dist = result.prizeDistribution;
    final rates = result.prizeRates;
    final total = result.totalSimulations;

    final values =
        _prizeKeys.map((k) => (dist[k] ?? 0).toDouble()).toList();
    final maxVal = values.fold<double>(0, (m, v) => v > m ? v : m);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '시뮬레이션 결과 (${_formatTotal(total)}회)',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            FilledButton.tonalIcon(
              onPressed: onAddToCompare,
              icon: const Icon(Icons.add_chart_rounded, size: 18),
              label: const Text('비교에 추가'),
              style: FilledButton.styleFrom(
                  visualDensity: VisualDensity.compact),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // 바 차트
        Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('등수별 분포',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: maxVal < 1 ? 1 : maxVal * 1.2,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (group, gi, rod, ri) {
                            final label = _prizeLabels[group.x];
                            final cnt = dist[_prizeKeys[group.x]] ?? 0;
                            final rate = rates[_prizeKeys[group.x]] ?? 0;
                            return BarTooltipItem(
                              '$label\n$cnt회 (${(rate * 100).toStringAsFixed(2)}%)',
                              const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            );
                          },
                        ),
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (v, meta) {
                              final idx = v.toInt();
                              if (idx < 0 || idx >= _prizeLabels.length) {
                                return const SizedBox.shrink();
                              }
                              return Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  _prizeLabels[idx],
                                  style: const TextStyle(fontSize: 11),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      barGroups: List.generate(_prizeKeys.length, (i) {
                        final val = values[i];
                        return BarChartGroupData(
                          x: i,
                          barRods: [
                            BarChartRodData(
                              toY: val < 0.5 && val > 0 ? 0.5 : val,
                              color: _prizeColors[i],
                              width: 28,
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(4)),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // 확률 테이블
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('확률 테이블',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(3),
                  },
                  children: [
                    _tableHeader(theme),
                    ...List.generate(_prizeKeys.length, (i) {
                      final key = _prizeKeys[i];
                      final cnt = dist[key] ?? 0;
                      final rate = rates[key] ?? 0;
                      return _tableRow(
                        theme,
                        _prizeLabels[i],
                        cnt,
                        rate,
                        _prizeColors[i],
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // 분석 vs 순수 랜덤 비교
        _RandomComparisonCard(result: result),

        // 1~3등 당첨 예측 결과
        if (result.topPrizeResults.isNotEmpty) ...[
          const SizedBox(height: 12),
          _TopPrizeResultsCard(topPrizeResults: result.topPrizeResults),
        ],
      ],
    );
  }

  TableRow _tableHeader(ThemeData theme) {
    final style = theme.textTheme.labelMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onSurfaceVariant,
    );
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
      ),
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('등수', style: style)),
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('횟수', style: style, textAlign: TextAlign.center)),
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('확률', style: style, textAlign: TextAlign.end)),
      ],
    );
  }

  TableRow _tableRow(
      ThemeData theme, String label, int cnt, double rate, Color color) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(label, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            '$cnt',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            rate == 0
                ? '0%'
                : '${(rate * 100).toStringAsFixed(rate < 0.01 ? 4 : 2)}%',
            textAlign: TextAlign.end,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  String _formatTotal(int n) {
    if (n >= 10000) return '${n ~/ 10000}만';
    if (n >= 1000) return '${n ~/ 1000}천';
    return '$n';
  }
}

// ────────────────────────────────────────────
// 분석 vs 순수 랜덤 비교 카드
// ────────────────────────────────────────────

class _RandomComparisonCard extends StatelessWidget {
  final BacktestResult result;

  const _RandomComparisonCard({required this.result});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final comparison = result.comparison;
    final rates = result.prizeRates;
    final randomRates = result.randomPrizeRates;

    final winRateDiff = comparison.winRateDiff;
    final winRateRelative = comparison.winRateRelative;
    final isPositive = winRateDiff > 0;
    final isNeutral = winRateDiff.abs() < 0.000001;
    final diffColor = isNeutral
        ? theme.colorScheme.onSurfaceVariant
        : (isPositive ? const Color(0xFF4CAF50) : const Color(0xFFF44336));
    final diffPrefix = isPositive ? '+' : '';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더 + 개선율 뱃지
            Row(
              children: [
                Text(
                  '분석 vs 순수 랜덤 비교',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: diffColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isNeutral
                        ? '±0%'
                        : isPositive
                            ? '+${winRateRelative.toStringAsFixed(1)}% 개선'
                            : '${(-winRateRelative).toStringAsFixed(1)}% 저하',
                    style: TextStyle(
                      color: diffColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 비교 테이블
            Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(3),
                3: FlexColumnWidth(2),
              },
              children: [
                _comparisonHeader(theme),
                ...List.generate(_prizeKeys.length, (i) {
                  final key = _prizeKeys[i];
                  final analysisCount =
                      result.prizeDistribution[key] ?? 0;
                  final randomCount =
                      result.randomPrizeDistribution[key] ?? 0;
                  return _comparisonRow(
                    theme,
                    _prizeLabels[i],
                    _prizeColors[i],
                    rates[key] ?? 0,
                    randomRates[key] ?? 0,
                    analysisCount: analysisCount,
                    randomCount: randomCount,
                    isNoneKey: key == 'none',
                  );
                }),
                _comparisonSummaryRow(
                  theme,
                  ['1st', '2nd', '3rd', '4th', '5th'].fold<int>(
                      0, (s, k) => s + (result.prizeDistribution[k] ?? 0)),
                  ['1st', '2nd', '3rd', '4th', '5th'].fold<int>(
                      0, (s, k) => s + (result.randomPrizeDistribution[k] ?? 0)),
                  comparison.winRateDiff,
                  diffColor,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // 절대 차이 텍스트
            Text(
              '랜덤 대비 절대 차이: $diffPrefix${(winRateDiff * 100).toStringAsFixed(3)}%p',
              style: theme.textTheme.bodySmall?.copyWith(
                color: diffColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            // 총 당첨금 비교
            _buildTotalPrizeSection(theme),
          ],
        ),
      ),
    );
  }

  TableRow _comparisonHeader(ThemeData theme) {
    final style = theme.textTheme.labelMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.onSurfaceVariant,
    );
    return TableRow(
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: theme.colorScheme.outlineVariant)),
      ),
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('등수', style: style)),
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('분석 기법', style: style, textAlign: TextAlign.center)),
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('순수 랜덤', style: style, textAlign: TextAlign.end)),
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('차이', style: style, textAlign: TextAlign.end)),
      ],
    );
  }

  TableRow _comparisonRow(
    ThemeData theme,
    String label,
    Color color,
    double analysisRate,
    double randomRate, {
    required int analysisCount,
    required int randomCount,
    required bool isNoneKey,
  }) {
    final diff = analysisRate - randomRate;
    // 꽝은 낮을수록 좋음 (분석이 꽝을 덜 뽑으면 유리)
    final isAnalysisBetter =
        isNoneKey ? diff < -0.0001 : diff > 0.0001;
    final diffText = diff.abs() < 0.000001
        ? '±0%'
        : diff > 0
            ? '+${(diff * 100).toStringAsFixed(2)}%'
            : '${(diff * 100).toStringAsFixed(2)}%';
    final diffColor = diff.abs() < 0.000001
        ? null
        : (isAnalysisBetter ? const Color(0xFF4CAF50) : const Color(0xFFF44336));

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 5),
              Text(label, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '$analysisCount',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: isAnalysisBetter ? FontWeight.bold : null,
              color: isAnalysisBetter ? const Color(0xFF4CAF50) : null,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '$randomCount',
            textAlign: TextAlign.end,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            diffText,
            textAlign: TextAlign.end,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: diff != 0 ? FontWeight.w600 : null,
              color: diffColor,
            ),
          ),
        ),
      ],
    );
  }

  TableRow _comparisonSummaryRow(ThemeData theme, int analysisWins,
      int randomWins, double winRateDiff, Color diffColor) {
    final style =
        theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold);
    final diffText = winRateDiff.abs() < 0.000001
        ? '±0%'
        : winRateDiff > 0
            ? '+${(winRateDiff * 100).toStringAsFixed(3)}%'
            : '${(winRateDiff * 100).toStringAsFixed(3)}%';
    return TableRow(
      decoration: BoxDecoration(
        border:
            Border(top: BorderSide(color: theme.colorScheme.outlineVariant)),
        color: theme.colorScheme.surfaceContainerLow,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text('당첨 합계', style: style),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            '$analysisWins',
            textAlign: TextAlign.center,
            style: style?.copyWith(color: diffColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            '$randomWins',
            textAlign: TextAlign.end,
            style: style?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            diffText,
            textAlign: TextAlign.end,
            style: style?.copyWith(color: diffColor),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalPrizeSection(ThemeData theme) {
    final analysisTotal = result.totalPrizeAnalysis;
    final randomTotal = result.totalPrizeRandom;
    final diff = analysisTotal - randomTotal;
    final isNeutralPrize = diff == 0;
    final prizeColor = isNeutralPrize
        ? theme.colorScheme.onSurfaceVariant
        : (diff > 0 ? const Color(0xFF4CAF50) : const Color(0xFFF44336));
    final diffPrefix = diff > 0 ? '+' : '';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '총 당첨금 비교',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('분석 기법',
                        style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant)),
                    Text(
                      NumberFormatUtils.formatKrw(analysisTotal),
                      style: theme.textTheme.bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('순수 랜덤',
                        style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant)),
                    Text(
                      NumberFormatUtils.formatKrw(randomTotal),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('차이',
                        style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant)),
                    Text(
                      isNeutralPrize
                          ? '±0원'
                          : '$diffPrefix${NumberFormatUtils.formatKrw(diff.abs())}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: prizeColor,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────
// 누적 비교 테이블
// ────────────────────────────────────────────

class _CompareTable extends StatelessWidget {
  final List<BacktestResult> results;
  final VoidCallback onClear;

  const _CompareTable({required this.results, required this.onClear});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '조합 비교',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton.icon(
              onPressed: onClear,
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              label: const Text('초기화'),
              style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Card(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            child: DataTable(
              headingRowHeight: 40,
              dataRowMinHeight: 48,
              dataRowMaxHeight: 64,
              columnSpacing: 20,
              columns: const [
                DataColumn(label: Text('조합')),
                DataColumn(label: Text('1등'), numeric: true),
                DataColumn(label: Text('5등'), numeric: true),
                DataColumn(label: Text('꽝'), numeric: true),
                DataColumn(label: Text('회차'), numeric: true),
                DataColumn(label: Text('횟수'), numeric: true),
              ],
              rows: results.asMap().entries.map((entry) {
                final idx = entry.key;
                final r = entry.value;
                final rates = r.prizeRates;
                final methodLabel = r.request.methodCodes.join('+');

                return DataRow(
                  color: idx % 2 == 0
                      ? null
                      : WidgetStateProperty.all(
                          theme.colorScheme.surfaceContainerLow),
                  cells: [
                    DataCell(
                      SizedBox(
                        width: 120,
                        child: Text(
                          methodLabel,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                    DataCell(Text(
                      '${((rates['1st'] ?? 0) * 100).toStringAsFixed(4)}%',
                      style: TextStyle(
                          color: _prizeColors[0],
                          fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text(
                      '${((rates['5th'] ?? 0) * 100).toStringAsFixed(2)}%',
                    )),
                    DataCell(Text(
                      '${((rates['none'] ?? 0) * 100).toStringAsFixed(1)}%',
                      style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant),
                    )),
                    DataCell(Text('${r.request.drawNo}회')),
                    DataCell(Text('${r.totalSimulations}')),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// ────────────────────────────────────────────
// 1~3등 당첨 예측 결과 카드
// ────────────────────────────────────────────

class _TopPrizeResultsCard extends StatelessWidget {
  final List<BacktestDrawResult> topPrizeResults;

  const _TopPrizeResultsCard({required this.topPrizeResults});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: const Color(0xFFFFB300).withValues(alpha: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.emoji_events_rounded,
                    color: Color(0xFFFFB300), size: 20),
                const SizedBox(width: 8),
                Text(
                  '고등 당첨 예측 성공 (${topPrizeResults.length}회)',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...topPrizeResults.asMap().entries.map((entry) {
              final idx = entry.key;
              final dr = entry.value;
              return Padding(
                padding: EdgeInsets.only(
                    bottom: idx < topPrizeResults.length - 1 ? 12 : 0),
                child: _TopPrizeItem(drawResult: dr, index: idx + 1),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _TopPrizeItem extends StatelessWidget {
  final BacktestDrawResult drawResult;
  final int index;

  const _TopPrizeItem({required this.drawResult, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final prizeColor = switch (drawResult.prize) {
      '1st' => const Color(0xFFFFB300),
      '2nd' => const Color(0xFF90CAF9),
      _ => const Color(0xFFFFAB40),
    };
    final prizeName = switch (drawResult.prize) {
      '1st' => '1등',
      '2nd' => '2등',
      _ => '3등',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: prizeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '#$index  $prizeName',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${drawResult.match}개 일치',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: LottoBallRow(
            numbers: drawResult.predicted,
            ballSize: 34,
          ),
        ),
      ],
    );
  }
}
