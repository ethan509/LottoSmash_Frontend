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

// Placeholder screens - will be replaced in Phase 4+
class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    redirect: (context, state) {
      final isAuthenticated = authState.valueOrNull ?? false;
      final isLoading = authState.isLoading;
      final location = state.uri.path;

      // 스플래시 화면은 항상 허용
      if (location == '/splash') return null;

      // 아직 로딩 중이면 스플래시로
      if (isLoading) return '/splash';

      final isPublicRoute = location == '/login' || location == '/register';

      // 미인증 + 비공개 경로 → 로그인으로
      if (!isAuthenticated && !isPublicRoute) return '/login';

      // 인증됨 + 로그인/회원가입 → 홈으로
      if (isAuthenticated && isPublicRoute) return '/home';

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
            builder: (context, state) =>
                const _PlaceholderScreen(title: '통계'),
            routes: [
              GoRoute(
                path: 'frequency',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const _PlaceholderScreen(title: '번호 출현 빈도'),
              ),
              GoRoute(
                path: 'bayesian',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const _PlaceholderScreen(title: '베이지안 분석'),
              ),
              GoRoute(
                path: 'pairs',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const _PlaceholderScreen(title: '번호 쌍 통계'),
              ),
              GoRoute(
                path: 'consecutive',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const _PlaceholderScreen(title: '연속번호 패턴'),
              ),
              GoRoute(
                path: 'ratio',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const _PlaceholderScreen(title: '홀짝/고저 비율'),
              ),
              GoRoute(
                path: 'colors',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const _PlaceholderScreen(title: '색상 패턴'),
              ),
              GoRoute(
                path: 'grid',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) =>
                    const _PlaceholderScreen(title: '행열 패턴'),
              ),
            ],
          ),
          GoRoute(
            path: '/recommend',
            builder: (context, state) =>
                const _PlaceholderScreen(title: '번호 추천'),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      // Notifications (full screen)
      GoRoute(
        path: '/notifications',
        builder: (context, state) =>
            const _PlaceholderScreen(title: '알림'),
      ),
    ],
  );
});
