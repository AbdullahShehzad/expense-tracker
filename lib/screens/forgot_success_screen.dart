import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_wise/screens/reset_password_screen.dart';

import '../widgets/custom_button.dart';
import 'login_screen.dart';

class ForgotSuccessScreen extends StatefulWidget {
  final String email;

  const ForgotSuccessScreen({required this.email, super.key});

  @override
  State<ForgotSuccessScreen> createState() => _ForgotSuccessScreenState();
}

class _ForgotSuccessScreenState extends State<ForgotSuccessScreen> {
  _continue() {
    Navigator.popUntil(context, (route) => false);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResetPasswordScreen(
          email2: widget.email,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 312,
                width: 312,
                child: SvgPicture.asset(
                  'assets/email-image.svg',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Your email is on the way',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Check your email and follow the instructions to reset your password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Continue',
                height: 56,
                width: double.infinity,
                onPressed: _continue,
                backgroundColor: const Color(0xFF392800),
                textColor: Colors.white,
                borderRadius: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                text: 'Back to Login',
                height: 56,
                width: double.infinity,
                onPressed: () {
                  Navigator.popUntil(context, (route) => false);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                backgroundColor: const Color(0xFF392800),
                textColor: Colors.white,
                borderRadius: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
