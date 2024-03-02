import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_wise/screens/login_screen.dart';

import '../constants/constants.dart';
import '../services/AuthServices.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _signup() async {
    if (_formKey.currentState!.validate()) {
      AuthService _authService = AuthService();

      dynamic result = await _authService.signUp(_emailController.text,
          _passwordController.text, _contactController.text);
      if (result is User) {
        print("Signup successful. Verification email has been sent.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please check your email to verify your account."),
          ),
        );
        // Optionally, navigate the user to a different screen here
      } else {
        print("Signup failed");
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
                      height: 123,
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
                      height: 53,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 2,
                      ),
                      child: Text(
                        'Get Started!',
                        style: GoogleFonts.notoSansJavanese(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomField(
                      textEditingController: _nameController,
                      title: 'Name',
                      hintText: 'Enter Name',
                    ),
                    const SizedBox(
                      height: 18,
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
                      textEditingController: _contactController,
                      title: 'Contact',
                      hintText: 'Enter Contact',
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomField(
                      textEditingController: _countryController,
                      title: 'Country',
                      hintText: 'Select Country',
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomField(
                      textEditingController: _cityController,
                      title: 'City',
                      hintText: 'Select City',
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
                    const SizedBox(
                      height: 36,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: 'Sign Up',
                        height: 40,
                        width: 200,
                        onPressed: _signup,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
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
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            ' Log in',
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
