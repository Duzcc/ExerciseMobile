import 'package:flutter/material.dart';
import 'screens/exercise1/core_widgets_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoreWidgetsScreen(),
    ),
  );
}

typedef CoreWidgetsDemo = CoreWidgetsScreen;
