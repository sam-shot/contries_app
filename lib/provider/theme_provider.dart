import 'package:flutter/material.dart';

class MTheme with ChangeNotifier {
  var mode = ThemeMode.system;

  ThemeMode currentTheme() {
    return mode;
  }

  
  void switchTheme() {
    mode = ThemeMode.dark;
    notifyListeners();
  }

  void switchTheme2() {
    mode = ThemeMode.light;
    notifyListeners();
  }
   void switchTheme3() {
    mode = ThemeMode.system;
    notifyListeners();
  }
}
