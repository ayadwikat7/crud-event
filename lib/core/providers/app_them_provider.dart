import 'package:flutter/material.dart';

class AppThemProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;
  void ChangeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) return;
    appTheme = newTheme;
    notifyListeners();
  }
}
