import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../widgets/stat_card.dart';

class StatsOverviewScreen extends StatelessWidget {
  const StatsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.stats),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.1,
        children: [
          StatCard(
            icon: Icons.bar_chart,
            title: AppStrings.numberFrequency,
            description: '1~45번 번호별 출현 횟수',
            onTap: () => context.push('/stats/frequency'),
          ),
          StatCard(
            icon: Icons.psychology,
            title: AppStrings.bayesianAnalysis,
            description: 'HOT/COLD 번호 분석',
            onTap: () => context.push('/stats/bayesian'),
          ),
          StatCard(
            icon: Icons.link,
            title: AppStrings.pairStats,
            description: '번호 쌍 동시출현 통계',
            onTap: () => context.push('/stats/pairs'),
          ),
          StatCard(
            icon: Icons.linear_scale,
            title: AppStrings.consecutiveStats,
            description: '연속번호 패턴 분석',
            onTap: () => context.push('/stats/consecutive'),
          ),
          StatCard(
            icon: Icons.pie_chart,
            title: AppStrings.ratioStats,
            description: '홀짝/고저 비율 분포',
            onTap: () => context.push('/stats/ratio'),
          ),
          StatCard(
            icon: Icons.palette,
            title: AppStrings.colorStats,
            description: '번호 색상 패턴 분석',
            onTap: () => context.push('/stats/colors'),
          ),
          StatCard(
            icon: Icons.grid_on,
            title: AppStrings.gridStats,
            description: '행/열 배분 패턴 분석',
            onTap: () => context.push('/stats/grid'),
          ),
          StatCard(
            icon: Icons.grid_view,
            title: '행/열 분포 히트맵',
            description: 'ROW_COL_DIST 격자 시각화',
            onTap: () => context.push('/stats/grid-pattern'),
          ),
          StatCard(
            icon: Icons.whatshot,
            title: '엔트로피 히트맵',
            description: 'GRID_ENTROPY 산개 시각화',
            onTap: () => context.push('/stats/grid-entropy'),
          ),
        ],
      ),
    );
  }
}
