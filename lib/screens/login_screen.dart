import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_wise/constants/constants.dart';
import 'package:wallet_wise/screens/forgot_password_screen.dart';
import 'package:wallet_wise/screens/signup_screen.dart';
import 'package:wallet_wise/widgets/custom_button.dart';
import 'package:wallet_wise/widgets/custom_field.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../services/AuthServices.dart';
import 'check_login.dart';

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
      AuthService authService = AuthService();
      User? user = await authService.signIn(
          _emailController.text, _passwordController.text);
      if (user != null) {
        if (mounted) {
          Navigator.popUntil(context, (route) => false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckLogin(),
            ),
          );
        }
      } else {
        log("Login failed");
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
        body: SingleChildScrollView(
          child: SafeArea(
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
                    const SizedBox(
                      height: 180,
                    ),
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Your Password?',
                          style: GoogleFonts.notoSansJavanese(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white,
                          ),
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
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.2,
                            color: Colors.white,
                            letterSpacing: -0.45,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            ' Sign up',
                            style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.2,
                              color: kYellowColor,
                              letterSpacing: -0.45,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
