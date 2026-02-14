import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/draw_models.dart';
import '../data/repositories/draw_repository.dart';

/// 최신 당첨번호 1건 (홈 화면용)
final latestDrawProvider = FutureProvider<LottoDraw?>((ref) async {
  final repo = ref.watch(drawRepositoryProvider);
  final response = await repo.getDraws(limit: 1, offset: 0);
  return response.draws.isNotEmpty ? response.draws.first : null;
});

/// 당첨번호 목록 (페이지네이션)
final drawListProvider =
    AsyncNotifierProvider<DrawListNotifier, DrawListState>(
        () => DrawListNotifier());

class DrawListState {
  final List<LottoDraw> draws;
  final int totalCount;
  final bool hasMore;
  final bool isLoadingMore;

  const DrawListState({
    this.draws = const [],
    this.totalCount = 0,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  DrawListState copyWith({
    List<LottoDraw>? draws,
    int? totalCount,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return DrawListState(
      draws: draws ?? this.draws,
      totalCount: totalCount ?? this.totalCount,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class DrawListNotifier extends AsyncNotifier<DrawListState> {
  static const _pageSize = 20;

  @override
  Future<DrawListState> build() async {
    return _fetchPage(0);
  }

  Future<DrawListState> _fetchPage(int offset) async {
    final repo = ref.read(drawRepositoryProvider);
    final response = await repo.getDraws(limit: _pageSize, offset: offset);
    return DrawListState(
      draws: response.draws,
      totalCount: response.totalCount,
      hasMore: response.draws.length >= _pageSize,
    );
  }

  /// 다음 페이지 로드
  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));

    try {
      final repo = ref.read(drawRepositoryProvider);
      final response = await repo.getDraws(
        limit: _pageSize,
        offset: current.draws.length,
      );
      state = AsyncData(current.copyWith(
        draws: [...current.draws, ...response.draws],
        totalCount: response.totalCount,
        hasMore: response.draws.length >= _pageSize,
        isLoadingMore: false,
      ));
    } catch (e) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
      rethrow;
    }
  }

  /// 새로고침
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchPage(0));
  }
}

/// 특정 회차 상세 조회
final drawDetailProvider =
    FutureProvider.family<LottoDraw, int>((ref, drawNo) async {
  final repo = ref.watch(drawRepositoryProvider);
  return await repo.getDraw(drawNo);
});
