class ApiEndpoints {
  static const String _base = '/api';

  // Auth
  static const String guestLogin = '$_base/auth/guest';
  static const String sendCode = '$_base/auth/send-code';
  static const String register = '$_base/auth/register';
  static const String login = '$_base/auth/login';
  static const String refresh = '$_base/auth/refresh';
  static const String logout = '$_base/auth/logout';
  static const String me = '$_base/auth/me';
  static const String linkEmail = '$_base/auth/link-email';
  static const String changePassword = '$_base/auth/change-password';
  static const String checkNickname = '$_base/auth/check-nickname';

  // Lotto Draws
  static const String draws = '$_base/lotto/draws';
  static String draw(int drawNo) => '$_base/lotto/draws/$drawNo';

  // Stats
  static const String stats = '$_base/lotto/stats';
  static const String statsNumbers = '$_base/lotto/stats/numbers';
  static const String statsReappear = '$_base/lotto/stats/reappear';
  static const String statsFirstLast = '$_base/lotto/stats/first-last';
  static const String statsPairs = '$_base/lotto/stats/pairs';
  static const String statsConsecutive = '$_base/lotto/stats/consecutive';
  static const String statsRatio = '$_base/lotto/stats/ratio';
  static const String statsColors = '$_base/lotto/stats/colors';
  static const String statsGrid = '$_base/lotto/stats/grid';
  static const String statsBayesian = '$_base/lotto/stats/bayesian';
  static const String statsBayesianHistory = '$_base/lotto/stats/bayesian/history';
  static String statsBayesianDraw(int drawNo) => '$_base/lotto/stats/bayesian/$drawNo';
  static const String statsAnalysis = '$_base/lotto/stats/analysis';
  static String statsAnalysisDraw(int drawNo) => '$_base/lotto/stats/analysis/$drawNo';
  static const String statsAnalysisHistory = '$_base/lotto/stats/analysis/history';

  // Recommend
  static const String methods = '$_base/lotto/methods';
  static const String combineMethods = '$_base/lotto/combine-methods';
  static const String recommend = '$_base/lotto/recommend';
  static const String recommendRandom = '$_base/lotto/recommend/random';
  static const String recommendations = '$_base/lotto/recommendations';
  static const String backtest = '$_base/lotto/backtest';

  // Grid Pattern 시각화 (ROW_COL_DIST / GRID_ENTROPY)
  static const String gridPattern = '$_base/lotto/grid-pattern';
  static const String gridEntropyPattern = '$_base/lotto/grid-entropy-pattern';

  // Notifications
  static const String deviceToken = '$_base/notifications/device-token';
  static const String notifications = '$_base/notifications';
  static const String winnings = '$_base/notifications/winnings';
  static const String winsUnread = '$_base/notifications/wins/unread';
  static const String winsRead = '$_base/notifications/wins/read';

  // Contact (개발자 문의)
  static const String contact = '$_base/contact/';

  // Admin
  static const String adminSync = '$_base/admin/lotto/sync';
}
