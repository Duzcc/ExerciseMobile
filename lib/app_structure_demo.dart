import 'package:flutter/material.dart';
import 'screens/exercise4/app_structure_screen.dart';

// Điểm chạy độc lập cho Exercise 4
void main() => runApp(const AppStructureStandalone());

class AppStructureStandalone extends StatefulWidget {
  const AppStructureStandalone({super.key});

  @override
  State<AppStructureStandalone> createState() => _AppStructureStandaloneState();
}

class _AppStructureStandaloneState extends State<AppStructureStandalone> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise 4 Demo',
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: AppStructureScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}
