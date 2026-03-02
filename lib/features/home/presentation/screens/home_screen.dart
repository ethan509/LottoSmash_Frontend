import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/cache/cache_manager.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../core/utils/number_format_utils.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/lotto_ball.dart';
import '../../../../shared/widgets/winning_alert_dialog.dart';
import '../../../../shared/widgets/zam_received_dialog.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../notifications/data/repositories/notification_repository.dart';
import '../../../draws/data/models/draw_models.dart';
import '../../../draws/providers/draw_provider.dart';
import '../../../stats/data/models/stats_models.dart';
import '../../data/models/fun_stats_models.dart';
import '../../providers/home_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _zamChecked = false;
  bool _winsChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _tryZamCheck());
  }

  void _tryZamCheck() {
    final user = ref.read(currentUserProvider).valueOrNull;
    if (user != null && !_zamChecked) {
      _zamChecked = true;
      _checkAndShowZam(user.zamBalance);
    }
    // 정회원 이상만 당첨 알림 확인
    if (user != null && !_winsChecked && (user.tier?.level ?? 0) >= 1) {
      _winsChecked = true;
      _checkAndShowWins();
    }
  }

  Future<void> _checkAndShowWins() async {
    try {
      final repo = ref.read(notificationRepositoryProvider);
      final result = await repo.getUnreadWins();
      if (!mounted || result.totalCount == 0) return;

      await WinningAlertDialog.show(
        context,
        wins: result.wins,
        onConfirm: () async {
          Navigator.of(context).pop();
          await repo.markWinsAsRead();
        },
      );
    } catch (_) {
      // 당첨 알림 실패는 조용히 무시
    }
  }

  Future<void> _checkAndShowZam(int currentZam) async {
    final prefs = ref.read(sharedPreferencesProvider);
    const key = 'last_zam_balance';
    final lastZam = prefs.getInt(key);
    await prefs.setInt(key, currentZam);

    if (!mounted) return;

    final gained = lastZam == null ? currentZam : currentZam - lastZam;
    if (gained > 0) {
      await ZamReceivedDialog.show(
        context,
        zamAmount: gained,
        isWelcome: lastZam == null,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 유저 데이터가 나중에 로드되는 경우 대비
    ref.listen(currentUserProvider, (prev, next) {
      final user = next.valueOrNull;
      if (user != null && !_zamChecked) {
        _zamChecked = true;
        _checkAndShowZam(user.zamBalance);
      }
      if (user != null && !_winsChecked && (user.tier?.level ?? 0) >= 1) {
        _winsChecked = true;
        _checkAndShowWins();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => context.push('/notifications'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(latestDrawProvider);
          ref.invalidate(bayesianSummaryProvider);
          ref.invalidate(funStatsProvider);
          ref.invalidate(currentUserProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _UserInfoCard(),
              const SizedBox(height: 16),
              _LatestDrawCard(),
              const SizedBox(height: 16),
              _QuickRecommendCard(),
              const SizedBox(height: 16),
              _HotColdCard(),
              const SizedBox(height: 16),
              _FunStatsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

/// 사용자 정보 + Zam 잔액
class _UserInfoCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: userAsync.when(
          loading: () => const ShimmerLoading(height: 48),
          error: (_, _) => const SizedBox.shrink(),
          data: (user) {
            if (user == null) return const SizedBox.shrink();

            final tierColor = _getTierColor(user.tier?.code);
            final displayName = user.nickname ?? user.email ?? '게스트';
            final tierName = user.tier?.name ?? '게스트';

            return Row(
              children: [
                // 프로필 아이콘
                CircleAvatar(
                  backgroundColor: tierColor.withValues(alpha: 0.2),
                  child: Icon(Icons.person, color: tierColor),
                ),
                const SizedBox(width: 12),
                // 닉네임 + 티어
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        tierName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: tierColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Zam 잔액
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 18,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${NumberFormatUtils.formatNumber(user.zamBalance)} Zam',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Color _getTierColor(String? tierCode) {
    switch (tierCode) {
      case 'MEMBER':
        return AppColors.memberTier;
      case 'GOLD':
        return AppColors.goldTier;
      case 'VIP':
        return AppColors.vipTier;
      default:
        return AppColors.guestTier;
    }
  }
}

/// 최신 당첨번호
class _LatestDrawCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawAsync = ref.watch(latestDrawProvider);
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.latestDraw,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/draws'),
                  child: const Text('전체보기'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            drawAsync.when(
              loading: () => const ShimmerLoading(height: 80),
              error: (error, _) => Text(
                error.toString(),
                style: TextStyle(color: theme.colorScheme.error),
              ),
              data: (draw) {
                if (draw == null) {
                  return const Text(AppStrings.noData);
                }
                return _LatestDrawContent(draw: draw);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _LatestDrawContent extends StatelessWidget {
  final LottoDraw draw;

  const _LatestDrawContent({required this.draw});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firstPerGame = draw.firstPerGame > 0
        ? draw.firstPerGame
        : draw.firstWinners > 0
            ? draw.firstPrize ~/ draw.firstWinners
            : 0;

    return InkWell(
      onTap: () => context.push('/draws/${draw.drawNo}'),
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '제 ${draw.drawNo}회',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                AppDateUtils.formatDateString(draw.drawDate),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: LottoBallRow(
              numbers: draw.numbers,
              bonusNumber: draw.bonusNum,
              ballSize: 40,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '1등  ${NumberFormatUtils.formatNumber(draw.firstWinners)}명',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                NumberFormatUtils.formatKrw(firstPerGame),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 빠른 추천 버튼
class _QuickRecommendCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.colorScheme.primaryContainer,
      child: InkWell(
        onTap: () => context.go('/recommend'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                Icons.auto_awesome,
                size: 32,
                color: theme.colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.generateRecommend,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'AI 통계 분석 기반 번호 추천',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer
                            .withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// HOT/COLD 번호 미리보기
class _HotColdCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bayesianAsync = ref.watch(bayesianSummaryProvider);
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '통계 요약',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/stats'),
                  child: const Text('전체보기'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            bayesianAsync.when(
              loading: () => const ShimmerLoading(height: 100),
              error: (error, _) => Text(
                error.toString(),
                style: TextStyle(color: theme.colorScheme.error),
              ),
              data: (bayesian) => _HotColdContent(bayesian: bayesian),
            ),
          ],
        ),
      ),
    );
  }
}

class _HotColdContent extends StatelessWidget {
  final BayesianResponse bayesian;

  const _HotColdContent({required this.bayesian});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hotNumbers = bayesian.hotNumbers.take(5).toList();
    final coldNumbers = bayesian.coldNumbers.take(5).toList();

    return Column(
      children: [
        // HOT 번호
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.hotColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                AppStrings.hotNumbers,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.hotColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Wrap(
                spacing: 6,
                children: hotNumbers
                    .map((n) => LottoBall(number: n.number, size: 32))
                    .toList(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // COLD 번호
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.coldColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                AppStrings.coldNumbers,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.coldColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Wrap(
                spacing: 6,
                children: coldNumbers
                    .map((n) => LottoBall(number: n.number, size: 32))
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// 재미로 보는 통계 섹션
// ─────────────────────────────────────────────

class _FunStatsSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final funAsync = ref.watch(funStatsProvider);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '재미로 보는 통계',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (funAsync.valueOrNull != null) ...[
                const SizedBox(width: 8),
                Text(
                  '기준: ${funAsync.valueOrNull!.calculatedAt}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
        funAsync.when(
          loading: () => SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (_, _) => const ShimmerLoading(
                width: 160,
                height: 160,
              ),
            ),
          ),
          error: (_, _) => const SizedBox.shrink(),
          data: (stats) => _FunStatsCards(stats: stats),
        ),
      ],
    );
  }
}

class _FunStatsCards extends StatelessWidget {
  final FunStats stats;

  const _FunStatsCards({required this.stats});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _FunStatPrizeCard(
            label: '역대 최고 당첨금',
            icon: Icons.emoji_events,
            iconColor: const Color(0xFFFFD700),
            record: stats.maxPrizePerGame,
            valueBuilder: (v) => NumberFormatUtils.formatKrw(v),
          ),
          const SizedBox(width: 12),
          _FunStatPrizeCard(
            label: '역대 최소 당첨금',
            icon: Icons.trending_down,
            iconColor: Colors.blueGrey,
            record: stats.minPrizePerGame,
            valueBuilder: (v) => NumberFormatUtils.formatKrw(v),
          ),
          const SizedBox(width: 12),
          _FunStatPrizeCard(
            label: '최다 1등 당첨자',
            icon: Icons.groups,
            iconColor: Colors.green,
            record: stats.maxWinners,
            valueBuilder: (v) => '${NumberFormatUtils.formatNumber(v)}명',
          ),
          const SizedBox(width: 12),
          _FunStatPrizeCard(
            label: '최소 1등 당첨자',
            icon: Icons.person,
            iconColor: Colors.orange,
            record: stats.minWinners,
            valueBuilder: (v) => '${NumberFormatUtils.formatNumber(v)}명',
          ),
          const SizedBox(width: 12),
          _FunStatAbsentCard(absent: stats.longestAbsent),
          const SizedBox(width: 12),
          _FunStatDrawListCard(
            label: '전체 홀수 회차',
            icon: Icons.looks_one,
            color: const Color(0xFFFF7272),
            draws: stats.allOddDraws,
          ),
          const SizedBox(width: 12),
          _FunStatDrawListCard(
            label: '전체 짝수 회차',
            icon: Icons.looks_two,
            color: const Color(0xFF69C8F2),
            draws: stats.allEvenDraws,
          ),
        ],
      ),
    );
  }
}

/// 당첨금 / 당첨자 수 공용 카드
class _FunStatPrizeCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final FunStatRecord record;
  final String Function(int) valueBuilder;

  const _FunStatPrizeCard({
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.record,
    required this.valueBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: 160,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 18, color: iconColor),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      label,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Text(
                valueBuilder(record.value),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '제 ${record.drawNo}회  ${AppDateUtils.formatDateString(record.drawDate)}',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 최장 미출현 번호 카드
class _FunStatAbsentCard extends StatelessWidget {
  final FunStatAbsent absent;

  const _FunStatAbsentCard({required this.absent});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: 160,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.hourglass_empty, size: 18,
                      color: Colors.purple),
                  const SizedBox(width: 6),
                  Text(
                    '최장 미출현 번호',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              LottoBall(number: absent.number, size: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${absent.fromDrawNo}회 ~ ${absent.toDrawNo}회',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${absent.duration}회 연속 미출현',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 전체 홀수 / 짝수 회차 카드 (탭 시 모달)
class _FunStatDrawListCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final List<FunStatDraw> draws;

  const _FunStatDrawListCard({
    required this.label,
    required this.icon,
    required this.color,
    required this.draws,
  });

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => _FunStatDrawModal(label: label, draws: draws),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: draws.isNotEmpty ? () => _showModal(context) : null,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 160,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 18, color: color),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        label,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${draws.length}회',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      draws.isNotEmpty ? '목록 보기' : '기록 없음',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: draws.isNotEmpty
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (draws.isNotEmpty) ...[
                      const SizedBox(width: 2),
                      Icon(Icons.chevron_right,
                          size: 14, color: theme.colorScheme.primary),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 홀수/짝수 회차 목록 모달
class _FunStatDrawModal extends StatelessWidget {
  final String label;
  final List<FunStatDraw> draws;

  const _FunStatDrawModal({required this.label, required this.draws});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, controller) => Column(
        children: [
          // 핸들
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  label,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '총 ${draws.length}회',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              controller: controller,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: draws.length,
              itemBuilder: (_, i) {
                final draw = draws[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 64,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '제 ${draw.drawNo}회',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              AppDateUtils.formatDateString(draw.drawDate),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: LottoBallRow(
                            numbers: draw.numbers,
                            ballSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
