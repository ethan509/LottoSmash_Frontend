import 'package:flutter/material.dart';
import '../../features/notifications/data/models/notification_models.dart';
import 'lotto_ball.dart';

class WinningAlertDialog extends StatelessWidget {
  final List<UnreadWin> wins;
  final VoidCallback onConfirm;

  const WinningAlertDialog({
    super.key,
    required this.wins,
    required this.onConfirm,
  });

  static Future<void> show(
    BuildContext context, {
    required List<UnreadWin> wins,
    required VoidCallback onConfirm,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WinningAlertDialog(wins: wins, onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 헤더
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('🎉', style: TextStyle(fontSize: 28)),
                const SizedBox(width: 8),
                Text(
                  '당첨 결과 알림',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '추천 번호가 당첨됐습니다!',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),

            // 당첨 목록 (스크롤 가능)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 320),
              child: SingleChildScrollView(
                child: Column(
                  children: wins.map((w) => _WinCard(win: w)).toList(),
                ),
              ),
            ),

            const SizedBox(height: 16),

            FilledButton(
              onPressed: onConfirm,
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
              ),
              child: const Text('확인'),
            ),
          ],
        ),
      ),
    );
  }
}

class _WinCard extends StatelessWidget {
  final UnreadWin win;

  const _WinCard({required this.win});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rank = win.prizeRank;
    final rankInfo = _rankInfo(rank);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: rankInfo.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: rankInfo.color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 등수 + 회차
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: rankInfo.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  rankInfo.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${win.drawNo}회차',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              Text(
                '${win.matchedCount}개 일치'
                '${win.bonusMatched ? ' + 보너스' : ''}',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 일치한 번호
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: LottoBallRow(
              numbers: win.matchedNumbers,
              ballSize: 32,
              spacing: 3,
            ),
          ),
        ],
      ),
    );
  }

  _RankInfo _rankInfo(int rank) {
    switch (rank) {
      case 1:
        return _RankInfo('1등 🏆', const Color(0xFFFFB300));
      case 2:
        return _RankInfo('2등', const Color(0xFF78909C));
      case 3:
        return _RankInfo('3등', const Color(0xFFFF7043));
      case 4:
        return _RankInfo('4등', const Color(0xFF42A5F5));
      case 5:
        return _RankInfo('5등', const Color(0xFF66BB6A));
      default:
        return _RankInfo('당첨', const Color(0xFF9C27B0));
    }
  }
}

class _RankInfo {
  final String label;
  final Color color;
  _RankInfo(this.label, this.color);
}
