import 'package:flutter/material.dart';
import 'package:wallet_wise/constants/constants.dart';
import 'package:wallet_wise/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WalletWise',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kYellowColor,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
