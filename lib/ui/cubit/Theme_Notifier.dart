import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  ThemeData get currentTheme => _isDarkMode ? ThemeData.dark() : ThemeData.light();

  void changetheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();  // Temayı değiştirdikten sonra dinleyicilere haber verir.
  }
}
