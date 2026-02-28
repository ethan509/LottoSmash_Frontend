import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_strings.dart';
import '../../core/services/fcm_service.dart';

class BottomNavShell extends ConsumerStatefulWidget {
  final Widget child;

  const BottomNavShell({super.key, required this.child});

  @override
  ConsumerState<BottomNavShell> createState() => _BottomNavShellState();
}

class _BottomNavShellState extends ConsumerState<BottomNavShell> {
  static const _tabs = [
    '/home',
    '/draws',
    '/stats',
    '/recommend',
    '/profile',
  ];

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    for (int i = 0; i < _tabs.length; i++) {
      if (location.startsWith(_tabs[i])) return i;
    }
    return 0;
  }

  @override
  void initState() {
    super.initState();
    // 포그라운드 FCM 메시지 리스너 — 앱이 켜진 상태에서 알림 수신 시 배너 표시
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.listenManual(fcmForegroundMessageProvider, (prev, message) {
        if (message == null) return;
        _showFcmBanner(message);
        // 표시 후 초기화 (같은 메시지 중복 표시 방지)
        ref.read(fcmForegroundMessageProvider.notifier).state = null;
      });
    });
  }

  void _showFcmBanner(RemoteMessage message) {
    if (!mounted) return;
    final title = message.notification?.title ?? '새 알림';
    final body = message.notification?.body ?? '';
    final type = message.data['type'] as String?;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (body.isNotEmpty)
              Text(body, style: const TextStyle(fontSize: 13)),
          ],
        ),
        action: SnackBarAction(
          label: '보기',
          onPressed: () => _navigateForType(type, message.data),
        ),
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navigateForType(String? type, Map<String, dynamic> data) {
    switch (type) {
      case 'new_draw':
        final drawNo = data['draw_no'] as String?;
        if (drawNo != null) {
          context.push('/draws/$drawNo');
        } else {
          context.push('/draws');
        }
      case 'winning':
        context.push('/notifications?tab=1');
      default:
        context.push('/notifications');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _currentIndex(context);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          if (index != currentIndex) {
            context.go(_tabs[index]);
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: AppStrings.navHome,
          ),
          NavigationDestination(
            icon: Icon(Icons.format_list_numbered_outlined),
            selectedIcon: Icon(Icons.format_list_numbered),
            label: AppStrings.navDraws,
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: AppStrings.navStats,
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined),
            selectedIcon: Icon(Icons.auto_awesome),
            label: AppStrings.navRecommend,
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: AppStrings.navProfile,
          ),
        ],
      ),
    );
  }
}
