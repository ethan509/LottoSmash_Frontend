import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../cache/cache_manager.dart';

final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return ThemeModeNotifier(prefs);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final SharedPreferences _prefs;
  static const String _key = 'theme_mode';

  ThemeModeNotifier(this._prefs) : super(_loadFromPrefs(_prefs));

  static ThemeMode _loadFromPrefs(SharedPreferences prefs) {
    final value = prefs.getString(_key);
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    switch (mode) {
      case ThemeMode.light:
        await _prefs.setString(_key, 'light');
      case ThemeMode.dark:
        await _prefs.setString(_key, 'dark');
      case ThemeMode.system:
        await _prefs.remove(_key);
    }
  }
}
