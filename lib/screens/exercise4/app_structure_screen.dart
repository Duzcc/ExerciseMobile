import 'package:flutter/material.dart';

/// Exercise 4: Cấu trúc màn hình chuẩn với Scaffold, AppBar, FAB và Theme Dark/Light
class AppStructureScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const AppStructureScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<AppStructureScreen> createState() => _AppStructureScreenState();
}

class _AppStructureScreenState extends State<AppStructureScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // 1. AppBar với hành động chuyển Dark Mode
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Icon(
                  widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Switch(
                  value: widget.isDarkMode,
                  onChanged: widget.onThemeChanged,
                ),
              ],
            ),
          ),
        ],
      ),

      // 2. Body giao diện
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Card giới thiệu Scaffold
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.architecture,
                      size: 64,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Scaffold Screen Architecture',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Scaffold cung cấp khung sườn hoàn chỉnh cho màn hình Material Design bao gồm AppBar, Body, FloatingActionButton, BottomNavigationBar, Drawer,...',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card kiểm tra chế độ Theme
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: widget.isDarkMode
                      ? Colors.amber.withAlpha(50)
                      : Colors.indigo.withAlpha(50),
                  child: Icon(
                    widget.isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                    color: widget.isDarkMode ? Colors.amber : Colors.indigo,
                  ),
                ),
                title: Text(
                  widget.isDarkMode ? 'Chế độ: Dark Mode' : 'Chế độ: Light Mode',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  widget.isDarkMode
                      ? 'Giao diện đang áp dụng bảng màu tối bảo vệ mắt'
                      : 'Giao diện đang áp dụng bảng màu sáng chuẩn Material 3',
                ),
                trailing: TextButton(
                  onPressed: () => widget.onThemeChanged(!widget.isDarkMode),
                  child: const Text('Đổi'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bộ đếm tương tác với FAB
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'Số lần bấm FloatingActionButton:',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$_counter',
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Nhấn nút (+) ở góc dưới bên phải để tăng giá trị',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 3. FloatingActionButton
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _counter++;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('⚡ Đã tăng bộ đếm lên: $_counter'),
              duration: const Duration(milliseconds: 900),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Thêm mới'),
      ),
    );
  }
}
