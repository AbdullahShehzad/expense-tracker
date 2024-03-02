import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_wise/constants/constants.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE9AB17),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 67,),
                  Text(
                    "Let's setup your account!",
                    style: GoogleFonts.inter(
                      fontSize: 36,
                      color: Color(0xFF212325),
                    ),
                  ),
                  SizedBox(height: 37,),
                  Text(
                    'Account can be your bank, credit card, or your wallet.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xFF292B2D),
                    ),
                  ),
                  SizedBox(height: 420,),
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF392800), // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // Adjust as per your need
                      ),
                      minimumSize: Size(double.infinity, 56), // Set width to infinity and height to 56
                    ),
                    child: const Text(
                      'Let\'s Go',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFCFCFC),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,

                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
