import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  // Sign up with email and password
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      if (user != null && !user.emailVerified) {
        await sendVerificationEmail(user);
      }

      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Send verification email
  Future<void> sendVerificationEmail(User user) async {
    try {
      await user.sendEmailVerification();
      print("Verification email has been sent.");
    } catch (e) {
      print("An error occurred while sending the verification email: $e");
    }
  }

  // Sign in with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
