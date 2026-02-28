import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottosmash/shared/widgets/bottom_nav_bar.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/profile_screen.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/draws/presentation/screens/draw_list_screen.dart';
import '../../features/draws/presentation/screens/draw_detail_screen.dart';
import '../../features/stats/presentation/screens/stats_overview_screen.dart';
import '../../features/stats/presentation/screens/number_frequency_screen.dart';
import '../../features/stats/presentation/screens/bayesian_screen.dart';
import '../../features/stats/presentation/screens/pair_stats_screen.dart';
import '../../features/stats/presentation/screens/consecutive_screen.dart';
import '../../features/stats/presentation/screens/ratio_stats_screen.dart';
import '../../features/stats/presentation/screens/color_stats_screen.dart';
import '../../features/stats/presentation/screens/grid_stats_screen.dart';
import '../../features/stats/presentation/screens/grid_pattern_screen.dart';
import '../../features/stats/presentation/screens/grid_entropy_screen.dart';
import '../../features/recommend/presentation/screens/recommend_screen.dart';
import '../../features/recommend/presentation/screens/recommend_history_screen.dart';
import '../../features/backtest/presentation/screens/backtest_screen.dart';
import '../../features/notifications/presentation/screens/notification_list_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

/// auth 상태가 바뀔 때 GoRouter의 redirect를 재평가하는 Listenable
class _AuthNotifier extends ChangeNotifier {
  _AuthNotifier(Ref ref) {
    ref.listen(authStateNotifierProvider, (prev, next) => notifyListeners());
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = _AuthNotifier(ref);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final authState = ref.read(authStateNotifierProvider);
      final isAuthenticated = authState.valueOrNull ?? false;
      final location = state.uri.path;

      // 스플래시 화면은 항상 허용 (자체적으로 네비게이션 처리)
      if (location == '/splash') return null;

      // 인증됨 + 로그인 화면 → 홈으로 (회원가입은 게스트도 접근 가능)
      if (isAuthenticated && location == '/login') return '/home';

      // 인증 필요 경로: 알림만 보호
      if (!isAuthenticated && location == '/notifications') return '/login';

      return null;
    },
    routes: [
      // Splash
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      // Auth
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      // Main Shell (하단 네비게이션)
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BottomNavShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/draws',
            builder: (context, state) => const DrawListScreen(),
            routes: [
              GoRoute(
                path: ':drawNo',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  final drawNo =
                      int.parse(state.pathParameters['drawNo']!);
                  return DrawDetailScreen(drawNo: drawNo);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/stats',
            builder: (context, state) => const StatsOverviewScreen(),
            routes: [
              GoRoute(
                path: 'frequency',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const NumberFrequencyScreen(),
              ),
              GoRoute(
                path: 'bayesian',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const BayesianScreen(),
              ),
              GoRoute(
                path: 'pairs',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const PairStatsScreen(),
              ),
              GoRoute(
                path: 'consecutive',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const ConsecutiveScreen(),
              ),
              GoRoute(
                path: 'ratio',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const RatioStatsScreen(),
              ),
              GoRoute(
                path: 'colors',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const ColorStatsScreen(),
              ),
              GoRoute(
                path: 'grid',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const GridStatsScreen(),
              ),
              GoRoute(
                path: 'grid-pattern',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const GridPatternScreen(),
              ),
              GoRoute(
                path: 'grid-entropy',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const GridEntropyScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/recommend',
            builder: (context, state) => const RecommendScreen(),
            routes: [
              GoRoute(
                path: 'history',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const RecommendHistoryScreen(),
              ),
              GoRoute(
                path: 'backtest',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const BacktestScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      // Notifications (full screen)
      // ?tab=1 로 진입하면 당첨 확인 탭으로 바로 이동 (FCM 라우팅용)
      GoRoute(
        path: '/notifications',
        builder: (context, state) {
          final tabParam = state.uri.queryParameters['tab'];
          final initialTab = int.tryParse(tabParam ?? '') ?? 0;
          return NotificationListScreen(initialTab: initialTab);
        },
      ),
    ],
  );
});
