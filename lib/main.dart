import 'package:flutter/material.dart';
import 'screens/landing_page.dart';

void main() => runApp(const HabitlyApp());

class HabitlyApp extends StatelessWidget {
  const HabitlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habitly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: HabitlyColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: HabitlyColors.terracotta,
          surface: HabitlyColors.background,
        ),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}
