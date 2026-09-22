import 'package:flutter/material.dart';
import 'screens/exercise5/common_ui_fixes_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CommonUiFixesScreen(),
    ),
  );
}

typedef CommonUiFixesDemo = CommonUiFixesScreen;
