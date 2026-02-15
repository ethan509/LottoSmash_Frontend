import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../data/models/auth_models.dart';
import '../../providers/auth_provider.dart';
import '../widgets/change_password_dialog.dart';
import '../widgets/link_email_dialog.dart';

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
            return const Center(child: Text('로그인이 필요합니다'));
          }
          return _ProfileBody(user: user);
        },
        loading: () => const LoadingIndicator(),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.invalidate(currentUserProvider),
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
          Card(
            child: Column(
              children: [
                if (_isGuest)
                  ListTile(
                    leading: const Icon(Icons.link),
                    title: const Text(AppStrings.linkEmail),
                    subtitle: const Text('이메일을 연동하여 데이터를 보호하세요'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _showLinkEmailDialog(context, ref),
                  )
                else
                  ListTile(
                    leading: const Icon(Icons.lock_outlined),
                    title: const Text(AppStrings.changePassword),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => _showChangePasswordDialog(context, ref),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 설정
          _ThemeSettingsCard(),

          const SizedBox(height: 24),

          // 로그아웃
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

  void _showLinkEmailDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (_) => const LinkEmailDialog(),
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
      await ref.read(authStateNotifierProvider.notifier).logout();
      if (context.mounted) {
        context.go('/login');
      }
    }
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
