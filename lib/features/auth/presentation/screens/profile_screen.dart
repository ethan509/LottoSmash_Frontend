import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/services/fcm_service.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../data/models/auth_models.dart';
import '../../providers/auth_provider.dart';
import '../widgets/change_password_dialog.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.navProfile),
      ),
      body: userAsync.when(
        data: (user) {
          if (user == null) {
            final isAuth = ref.watch(authStateNotifierProvider).valueOrNull ?? false;
            if (isAuth) {
              // 인증됐지만 getMe 실패 → 재시도 UI
              return _buildRetryPrompt(context, ref);
            }
            return _buildLoginPrompt(context);
          }
          return _ProfileBody(user: user);
        },
        loading: () => const LoadingIndicator(),
        error: (error, _) => _buildLoginPrompt(context),
      ),
    );
  }

  Widget _buildRetryPrompt(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 72,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text('정보를 불러올 수 없습니다', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              '네트워크 연결을 확인하고 다시 시도해주세요',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => ref.invalidate(currentUserProvider),
              icon: const Icon(Icons.refresh),
              label: const Text('다시 시도'),
              style: FilledButton.styleFrom(minimumSize: const Size(200, 48)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_outline,
              size: 80,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              '로그인이 필요합니다',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '회원가입 또는 로그인 후 이용해주세요',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => context.go('/login'),
              icon: const Icon(Icons.login),
              label: const Text('로그인'),
              style: FilledButton.styleFrom(
                minimumSize: const Size(200, 48),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => context.go('/register'),
              icon: const Icon(Icons.person_add_outlined),
              label: const Text('회원가입'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(200, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileBody extends ConsumerWidget {
  final User user;
  const _ProfileBody({required this.user});

  bool get _isGuest => user.email == null;

  String get _tierName {
    if (user.tier != null) return user.tier!.name;
    return '게스트';
  }

  Color get _tierColor {
    switch (user.tier?.code) {
      case 'VIP':
        return AppColors.vipTier;
      case 'GOLD':
        return AppColors.goldTier;
      case 'MEMBER':
        return AppColors.memberTier;
      default:
        return AppColors.guestTier;
    }
  }

  String? get _genderDisplay {
    switch (user.gender) {
      case 'M':
        return AppStrings.genderMale;
      case 'F':
        return AppStrings.genderFemale;
      case 'O':
        return AppStrings.genderOther;
      default:
        return null;
    }
  }

  String? get _frequencyDisplay {
    switch (user.purchaseFrequency) {
      case 'WEEKLY':
        return AppStrings.frequencyWeekly;
      case 'MONTHLY':
        return AppStrings.frequencyMonthly;
      case 'BIMONTHLY':
        return AppStrings.frequencyBimonthly;
      case 'IRREGULAR':
        return AppStrings.frequencyIrregular;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(currentUserProvider),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 유저 카드
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // 아바타
                  CircleAvatar(
                    radius: 40,
                    backgroundColor:
                        theme.colorScheme.primaryContainer,
                    child: Icon(
                      _isGuest ? Icons.person_outline : Icons.person,
                      size: 40,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // 닉네임 또는 이메일
                  Text(
                    user.nickname ?? user.email ?? '게스트',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (!_isGuest && user.nickname != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      user.email!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  // 티어 + Zam
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: _tierColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _tierName,
                          style: TextStyle(
                            color: _tierColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.monetization_on,
                                size: 16, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              '${user.zamBalance} Zam',
                              style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 프로필 정보
          Card(
            child: Column(
              children: [
                if (_genderDisplay != null)
                  ListTile(
                    leading: const Icon(Icons.wc_outlined),
                    title: const Text(AppStrings.gender),
                    trailing: Text(_genderDisplay!),
                  ),
                if (user.birthDate != null)
                  ListTile(
                    leading: const Icon(Icons.cake_outlined),
                    title: const Text(AppStrings.birthDate),
                    trailing: Text(user.birthDate!.split('T')[0]),
                  ),
                if (user.region != null)
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: const Text(AppStrings.region),
                    trailing: Text(user.region!),
                  ),
                if (_frequencyDisplay != null)
                  ListTile(
                    leading: const Icon(Icons.shopping_cart_outlined),
                    title: const Text(AppStrings.purchaseFrequency),
                    trailing: Text(_frequencyDisplay!),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 액션 버튼들
          if (_isGuest)
            _buildRegisterBanner(context, ref, theme)
          else
            Card(
              child: ListTile(
                leading: const Icon(Icons.lock_outlined),
                title: const Text(AppStrings.changePassword),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showChangePasswordDialog(context, ref),
              ),
            ),
          const SizedBox(height: 16),

          // 알림 설정
          const _NotificationSettingsCard(),
          const SizedBox(height: 16),

          // 설정
          _ThemeSettingsCard(),
          const SizedBox(height: 16),

          // 개발자 문의
          Card(
            child: ListTile(
              leading: const Icon(Icons.mail_outline),
              title: const Text('개발자에게 문의'),
              subtitle: const Text('버그 신고 및 기능 제안'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/contact'),
            ),
          ),

          const SizedBox(height: 24),

          // 로그아웃 (정회원 이상만 표시)
          if (!_isGuest)
            OutlinedButton.icon(
              onPressed: () => _handleLogout(context, ref),
              icon: const Icon(Icons.logout),
              label: const Text(AppStrings.logout),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
                side: BorderSide(color: theme.colorScheme.error),
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildRegisterBanner(BuildContext context, WidgetRef ref, ThemeData theme) {
    return InkWell(
      onTap: () => context.push('/register'),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primary,
              theme.colorScheme.primary.withValues(alpha: 0.75),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person_add_outlined, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '회원가입',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '지금 가입하면 Zam을 드려요!\n무료로 모든 기능을 이용하세요.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (_) => const ChangePasswordDialog(),
    );
  }

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(AppStrings.logout),
        content: const Text('로그아웃하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              AppStrings.confirm,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      // logout() 후 위젯이 트리에서 제거되므로 미리 참조 저장
      final router = GoRouter.of(context); // ignore: use_build_context_synchronously
      final messenger = ScaffoldMessenger.of(context); // ignore: use_build_context_synchronously
      await ref.read(authStateNotifierProvider.notifier).logout();
      messenger.showSnackBar(
        const SnackBar(content: Text('로그아웃되었습니다')),
      );
      router.go('/home');
    }
  }
}

/// 알림 ON/OFF 토글
final _notificationEnabledProvider = FutureProvider<bool>((ref) async {
  final settings = await FirebaseMessaging.instance.getNotificationSettings();
  return settings.authorizationStatus == AuthorizationStatus.authorized;
});

class _NotificationSettingsCard extends ConsumerWidget {
  const _NotificationSettingsCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifAsync = ref.watch(_notificationEnabledProvider);
    final isEnabled = notifAsync.valueOrNull ?? false;

    return Card(
      child: Column(
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.notifications_outlined),
            title: const Text('푸시 알림'),
            subtitle: Text(isEnabled ? '알림이 활성화되어 있습니다' : '알림이 비활성화되어 있습니다'),
            value: isEnabled,
            onChanged: (value) async {
              if (value) {
                // 알림 권한 요청 + FCM 초기화
                await ref.read(fcmServiceProvider).initialize();
              } else {
                // 토큰 삭제로 알림 비활성화
                await ref.read(fcmServiceProvider).deleteToken();
              }
              ref.invalidate(_notificationEnabledProvider);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text('알림 내역'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/notifications'),
          ),
        ],
      ),
    );
  }
}

class _ThemeSettingsCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined),
            title: const Text('다크모드'),
            trailing: SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: Icon(Icons.settings_suggest, size: 18),
                ),
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: Icon(Icons.light_mode, size: 18),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: Icon(Icons.dark_mode, size: 18),
                ),
              ],
              selected: {themeMode},
              onSelectionChanged: (selected) {
                ref
                    .read(themeModeProvider.notifier)
                    .setThemeMode(selected.first);
              },
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
