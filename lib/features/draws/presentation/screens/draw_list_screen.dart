import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../../providers/draw_provider.dart';
import '../widgets/draw_card.dart';

class DrawListScreen extends ConsumerStatefulWidget {
  const DrawListScreen({super.key});

  @override
  ConsumerState<DrawListScreen> createState() => _DrawListScreenState();
}

class _DrawListScreenState extends ConsumerState<DrawListScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(drawListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final drawListAsync = ref.watch(drawListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.navDraws)),
      body: drawListAsync.when(
        loading: () => const ShimmerList(itemCount: 6, itemHeight: 120),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.read(drawListProvider.notifier).refresh(),
        ),
        data: (state) {
          if (state.draws.isEmpty) {
            return const Center(child: Text(AppStrings.noData));
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(drawListProvider.notifier).refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: state.draws.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.draws.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return DrawCard(draw: state.draws[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
