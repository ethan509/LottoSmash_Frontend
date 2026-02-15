import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_config.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden in main.dart');
});

final cacheManagerProvider = Provider<CacheManager>((ref) {
  return CacheManager(ref.watch(sharedPreferencesProvider));
});

class CacheManager {
  final SharedPreferences _prefs;
  static const String _prefix = 'cache_';
  static const String _tsPrefix = 'cache_ts_';

  CacheManager(this._prefs);

  /// 캐시에서 JSON 데이터 가져오기
  Map<String, dynamic>? get(String key) {
    if (isExpired(key)) {
      clear(key);
      return null;
    }
    final data = _prefs.getString('$_prefix$key');
    if (data == null) return null;
    return jsonDecode(data) as Map<String, dynamic>;
  }

  /// 캐시에 JSON 데이터 저장
  Future<void> set(
    String key,
    Map<String, dynamic> value, {
    Duration? ttl,
  }) async {
    final effectiveTtl = ttl ?? AppConfig.cacheTtl;
    final expiresAt =
        DateTime.now().add(effectiveTtl).millisecondsSinceEpoch;
    await _prefs.setString('$_prefix$key', jsonEncode(value));
    await _prefs.setInt('$_tsPrefix$key', expiresAt);
  }

  /// 캐시가 만료되었는지 확인
  bool isExpired(String key) {
    final expiresAt = _prefs.getInt('$_tsPrefix$key');
    if (expiresAt == null) return true;
    return DateTime.now().millisecondsSinceEpoch > expiresAt;
  }

  /// 특정 캐시 삭제
  Future<void> clear(String key) async {
    await _prefs.remove('$_prefix$key');
    await _prefs.remove('$_tsPrefix$key');
  }

  /// 모든 캐시 삭제
  Future<void> clearAll() async {
    final keys = _prefs.getKeys();
    for (final key in keys) {
      if (key.startsWith(_prefix) || key.startsWith(_tsPrefix)) {
        await _prefs.remove(key);
      }
    }
  }
}
