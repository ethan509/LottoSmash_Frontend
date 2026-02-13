import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottosmash/shared/widgets/bottom_nav_bar.dart';

// Placeholder screens - will be replaced in Phase 2+
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
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      // Splash
      GoRoute(
        path: '/splash',
        builder: (context, state) =>
            const _PlaceholderScreen(title: '스플래시'),
      ),
      // Auth
      GoRoute(
        path: '/login',
        builder: (context, state) =>
            const _PlaceholderScreen(title: '로그인'),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) =>
            const _PlaceholderScreen(title: '회원가입'),
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
            builder: (context, state) =>
                const _PlaceholderScreen(title: '홈'),
          ),
          GoRoute(
            path: '/draws',
            builder: (context, state) =>
                const _PlaceholderScreen(title: '당첨번호'),
            routes: [
              GoRoute(
                path: ':drawNo',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  final drawNo = state.pathParameters['drawNo']!;
                  return _PlaceholderScreen(title: '제 $drawNo회');
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
            builder: (context, state) =>
                const _PlaceholderScreen(title: '내 정보'),
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
