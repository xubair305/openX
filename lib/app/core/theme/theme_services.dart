import 'package:flutter/material.dart';
import 'package:openx/app/core/utils/index.dart';

class ThemeService {
  String themeMode = "system";

  final String _themeKey = "themeMode";

  ThemeMode get theme {
    if (isSavedThemeData == "system") {
      return ThemeMode.dark;
    }
    if (isSavedThemeData == "ligth") {
      return ThemeMode.light;
    }
    if (isSavedThemeData == "dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  String get isSavedThemeData {
    return StorageUtil.read(_themeKey) ?? 'system';
  }

  saveTheme(String value) {
    StorageUtil.write(_themeKey, value);
  }
}
