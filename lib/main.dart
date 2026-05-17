import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const PocApp());
}

class PocApp extends StatelessWidget {
  const PocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Figma × Flutter PoC',
      theme: AppTheme.theme,
      home: const DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
