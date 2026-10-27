import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // 1. Import your new screen file

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(), // 2. Set it as the home page
    );
  }
}
