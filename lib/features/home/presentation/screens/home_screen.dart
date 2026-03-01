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
                '1등 ${NumberFormatUtils.formatKrw(draw.firstPrize)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${NumberFormatUtils.formatNumber(draw.firstWinners)}게임 · 인당 ${NumberFormatUtils.formatKrw(firstPerGame)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2등 ${NumberFormatUtils.formatNumber(draw.secondWinners)}명'
                '  3등 ${NumberFormatUtils.formatNumber(draw.thirdWinners)}명',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                '4등 ${NumberFormatUtils.formatNumber(draw.fourthWinners)}명'
                '  5등 ${NumberFormatUtils.formatNumber(draw.fifthWinners)}명',
                style: theme.textTheme.labelSmall?.copyWith(
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
