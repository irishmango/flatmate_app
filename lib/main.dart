import 'package:flatmate_app/auth/presentation/login_screen.dart';
import 'package:flatmate_app/auth/presentation/register_screen.dart';
import 'package:flatmate_app/main_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.green),
      home: RegisterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
