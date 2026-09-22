import 'package:flutter/material.dart';
import 'screens/exercise2/input_controls_screen.dart';

// Điểm chạy độc lập cho Exercise 2
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InputControlsScreen(),
  ));
}

// Giữ nguyên class alias để tương thích với đề bài
typedef InputControlsDemo = InputControlsScreen;
