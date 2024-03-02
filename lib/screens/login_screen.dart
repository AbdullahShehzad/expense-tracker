import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_wise/constants/constants.dart';
import 'package:wallet_wise/widgets/custom_button.dart';
import 'package:wallet_wise/widgets/custom_field.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../services/AuthServices.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _login() async {
    if (_formKey.currentState!.validate()) {
      AuthService _authService = AuthService();
      User? user = await _authService.signIn(
          _emailController.text, _passwordController.text);
      if (user != null) {
        print("Login successful");
        // Navigate to the next screen or home page
      } else {
        print("Login failed");
        // Show error message
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF918C8C),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kYellowColor,
            kGreyColor.withOpacity(0),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Wallet',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Wise',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: kYellowColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 73,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 2,
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.notoSansJavanese(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 46,
                  ),
                  CustomField(
                    textEditingController: _emailController,
                    title: 'Email',
                    hintText: 'Enter Email',
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomField(
                    textEditingController: _passwordController,
                    title: 'Password',
                    hintText: 'Enter your password',
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Your Password?',
                      style: GoogleFonts.notoSansJavanese(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      text: 'Login',
                      height: 40,
                      width: 200,
                      onPressed: _login,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
