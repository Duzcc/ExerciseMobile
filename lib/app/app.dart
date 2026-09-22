import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import '../screens/home_screen.dart';

/// Ứng dụng Lab 4 Flutter UI
/// Quản lý ThemeMode cấp ứng dụng và routing
class Lab4App extends StatefulWidget {
  const Lab4App({super.key});

  @override
  State<Lab4App> createState() => _Lab4AppState();
}

class _Lab4AppState extends State<Lab4App> {
  // Trạng thái Theme hiện tại (Light hoặc Dark)
  ThemeMode _themeMode = ThemeMode.light;

  void _handleThemeChange(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 – Flutter UI Fundamentals',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: HomeScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _handleThemeChange,
      ),
    );
  }
}
