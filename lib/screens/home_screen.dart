import 'package:flutter/material.dart';
import '../../widgets/exercise_card.dart';
import 'exercise1/core_widgets_screen.dart';
import 'exercise2/input_controls_screen.dart';
import 'exercise3/layout_screen.dart';
import 'exercise4/app_structure_screen.dart';
import 'exercise5/common_ui_fixes_screen.dart';

/// Màn hình chính tổng quan của Lab 4 – Flutter UI Fundamentals
/// Đóng vai trò Dashboard điều hướng đến 5 Exercise
class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 – UI Fundamentals'),
        actions: [
          IconButton(
            tooltip: isDarkMode ? 'Chuyển sang Light Mode' : 'Chuyển sang Dark Mode',
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => onThemeChanged(!isDarkMode),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        children: [
          // Banner giới thiệu
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.tertiary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withAlpha(60),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'SV: TRẦN VĂN ĐỨC • MSV: 26A4041174',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Lab 4 – Flutter UI Fundamentals',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Thực hành 5 bài tập Flutter UI: Core Widgets, Input Controls, Layout Composition, Scaffold Architecture và UI Debugging.',
                  style: TextStyle(
                    color: Colors.white.withAlpha(220),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          // Exercise 1 Card
          ExerciseCard(
            exerciseNumber: 1,
            title: 'Core Display Widgets',
            description: 'Khám phá các widget hiển thị cơ bản Text, Icon, Image.network, Card và ListTile.',
            tags: const ['Text', 'Icon', 'Image', 'Card', 'ListTile'],
            icon: Icons.widgets_outlined,
            color: Colors.indigo,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoreWidgetsScreen(),
                ),
              );
            },
          ),

          // Exercise 2 Card
          ExerciseCard(
            exerciseNumber: 2,
            title: 'Input Controls & Pickers',
            description: 'Xử lý tương tác với Slider, SwitchListTile, RadioListTile và DatePicker.',
            tags: ['Slider', 'Switch', 'RadioListTile', 'DatePicker', 'Stateful'],
            icon: Icons.tune,
            color: Colors.teal,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InputControlsScreen(),
                ),
              );
            },
          ),

          // Exercise 3 Card
          ExerciseCard(
            exerciseNumber: 3,
            title: 'Layout Composition',
            description: 'Bố cục phân đoạn với Column, Row, Padding, SizedBox và cuộn ListView.builder an toàn.',
            tags: ['Column', 'Row', 'ListView.builder', 'Expanded', 'Spacing'],
            icon: Icons.view_quilt_outlined,
            color: Colors.orange.shade800,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayoutScreen(),
                ),
              );
            },
          ),

          // Exercise 4 Card
          ExerciseCard(
            exerciseNumber: 4,
            title: 'App Structure & Theme',
            description: 'Cấu trúc màn hình hoàn chỉnh bằng Scaffold, AppBar, FAB và chuyển đổi Dark Theme.',
            tags: ['Scaffold', 'AppBar', 'FAB', 'ThemeData', 'Dark Mode'],
            icon: Icons.layers_outlined,
            color: Colors.purple,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppStructureScreen(
                    isDarkMode: isDarkMode,
                    onThemeChanged: onThemeChanged,
                  ),
                ),
              );
            },
          ),

          // Exercise 5 Card
          ExerciseCard(
            exerciseNumber: 5,
            title: 'Debug & Fix Common UI Errors',
            description: 'Phân tích và sửa 4 lỗi layout kinh điển: Unbounded height, Overflow, setState và Context.',
            tags: ['Expanded', 'SingleChildScrollView', 'setState()', 'BuildContext'],
            icon: Icons.bug_report_outlined,
            color: Colors.red.shade700,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CommonUiFixesScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
