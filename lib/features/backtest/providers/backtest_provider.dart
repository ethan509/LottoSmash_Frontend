import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/backtest_models.dart';

// 선택된 분석 방법 코드 목록
final backtestMethodCodesProvider = StateProvider<List<String>>((ref) => []);

// 선택된 결합 방법
final backtestCombineMethodProvider = StateProvider<String>((ref) => 'SIMPLE_AVG');

// 테스트 회차 번호
final backtestDrawNoProvider = StateProvider<int?>((ref) => null);

// 시뮬레이션 횟수 (10 / 100 / 1000 / 10000)
final backtestCountProvider = StateProvider<int>((ref) => 1000);

// 백테스팅 결과
final backtestResultProvider =
    StateProvider<AsyncValue<BacktestResult?>>((ref) => const AsyncData(null));

// 누적 비교 목록
final backtestCompareListProvider = StateProvider<List<BacktestResult>>((ref) => []);
