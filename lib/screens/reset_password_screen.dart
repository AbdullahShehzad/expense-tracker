import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_field.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email2;
  const ResetPasswordScreen({required this.email2, super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> resetPassword(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.sendPasswordResetEmail(email: email);
      print("Password reset email sent.");
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      var uID = FirebaseAuth.instance.currentUser?.uid;
      if (uID != null) {
        DocumentReference userDoc = firestore.collection('users').doc(uID);

        try {
          await userDoc.update({
            'password': _newPasswordController
                .text, // Adds the 'pin' field to the user document
          });
          print("User password changed successfully.");
        } catch (e) {
          if (e is FirebaseException && e.code == 'not-found') {
            print("User document does not exist.");
            // Optionally, create the document if it doesn't exist
            // await userDoc.set({'pin': pin});
          } else {
            print("Error adding/updating user PIN: $e");
          }
        }
      } else {
        return;
      }
    } catch (error) {
      print("Error sending password reset email: $error");
      // Handle errors, e.g., by showing an alert to the user
    }
  }

  _forgotPassword() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF918C8C),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kYellowColor,
            Color(0xFF291D00),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
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
                        'Reset Password?',
                        style: GoogleFonts.notoSansJavanese(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: const Color(0xFF392800),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 50),
                      child: Text(
                        'Please type a new password and re-enter the password. Type something you will remember!',
                        style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    CustomField(
                      textEditingController: _newPasswordController,
                      title: 'New Password',
                      hintText: 'Enter New Password',
                      backgroundColor: kYellowColor.withOpacity(0.57),
                      titleColor: Colors.black,
                      suffixColor: const Color(0xFF392800),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomField(
                      textEditingController: _confirmPasswordController,
                      title: 'Confirm Password',
                      hintText: 'Enter New Password Again',
                      backgroundColor: kYellowColor.withOpacity(0.57),
                      titleColor: Colors.black,
                      suffixColor: const Color(0xFF392800),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: 'Reset Password',
                        height: 49,
                        width: 244,
                        onPressed: _forgotPassword,
                        backgroundColor: const Color(0xFF392800),
                        textColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t want to reset password? ',
                          style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.2,
                            color: Colors.black,
                            letterSpacing: -0.45,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.popUntil(context, (route) => false);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            ' Login',
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
