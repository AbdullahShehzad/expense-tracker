import 'package:flutter/material.dart';
import 'package:wallet_wise/constants/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wallet_wise/screens/check_login.dart';
import 'package:wallet_wise/screens/chat_screen.dart';
import 'package:wallet_wise/screens/main_screen.dart';
import 'package:wallet_wise/screens/onboarding.dart';
import 'package:wallet_wise/screens/profile_screen.dart';
import 'package:wallet_wise/screens/profile_settings.dart';
import 'package:wallet_wise/services/local_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WalletWise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kYellowColor,
        ),
        useMaterial3: true,
      ),
      home: const CheckLogin(),
    );
  }
}
