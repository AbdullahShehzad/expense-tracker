import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wise/screens/check_login.dart';

class WalletSetup extends StatefulWidget {
  const WalletSetup({super.key});

  @override
  State<WalletSetup> createState() => _WalletSetupState();
}

class _WalletSetupState extends State<WalletSetup> {
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  Future<void> addCardInfo(
    String accNo,
    String cvc,
  ) async {
    var uID = FirebaseAuth.instance.currentUser?.uid;
    if (uID != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference userDoc = firestore.collection('users').doc(uID);

      try {
        // await userDoc.update({'accountNumber': accNo, 'cvc': cvc});

        if (mounted) {
          Navigator.popUntil(context, (route) => false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckLogin(),
            ),
          );
        }
      } catch (e) {
        if (e is FirebaseException && e.code == 'not-found') {
          print("User document does not exist.");
          // Optionally, create the document if it doesn't exist
          // await userDoc.set({'pin': pin});
        } else {
          print("Error adding user accNo : $e");
        }
      }
    } else {
      print("kuch to masla hua hai in wallet setup page");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine the height of the screen
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF392800),
      body: Column(
        children: [
          Container(
            height: screenHeight * 1 / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                  ),
                  color: Colors.white,
                  iconSize: 28, // Size of the icon
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                const Text(
                  'Connect Wallet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_rounded,
                  ),
                  color: Colors.white,
                  iconSize: 28, // Size of the icon
                  onPressed: () {
                    print('Icon Button Pressed!');
                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            height: screenHeight * 3 / 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 23,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/wallet-card.png',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Add your Debit Card',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'This card must be connected to a bank account under your name',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFDDDDDD),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFE9AB17),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Enter Name',
                            labelText: 'Name On Card'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: _cardController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFDDDDDD),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFE9AB17),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Debit Card Number',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _cvcController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFDDDDDD),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFE9AB17),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'CVC',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFDDDDDD),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFE9AB17),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Expiration MM/YY',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFDDDDDD),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xFFE9AB17),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'ZIP',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add your onPressed functionality here
                        addCardInfo(_cardController.text, _cvcController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF392800), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              16), // Adjust as per your need
                        ),
                        minimumSize: Size(double.infinity,
                            56), // Set width to infinity and height to 56
                      ),
                      child: const Text(
                        'Finish',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFCFCFC),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
