import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:wallet_wise/screens/signup_screen.dart';

import '../constants/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back,
            color: Color(0xFF392800),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 80),
                      child: Text(
                        'Enter your Verification Code',
                        style: GoogleFonts.notoSansJavanese(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: const Color(0xFF392800),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 71,
                    ),
                    OTPTextField(
                      length: 5,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 58,
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      },
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
                        onPressed: () {},
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
