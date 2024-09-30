// import 'package:flutter/material.dart';
// import 'package:movies_app/core/resources/app_theme.dart';

// class ThemeProvider with ChangeNotifier {
//   bool _isDarkMode = false; // Default to light mode
//   ThemeData _themeData =
//       getApplicationTheme(Brightness.light);

//   bool isDarkMode() => _isDarkMode;

//   ThemeData getTheme() => _themeData;

//   void toggleTheme(bool isDarkMode) {
//     _isDarkMode = isDarkMode;
//     _themeData =
//         getApplicationTheme(_isDarkMode ? Brightness.dark : Brightness.light);
//     notifyListeners();
//   }
// }