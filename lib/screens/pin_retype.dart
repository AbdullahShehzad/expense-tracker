import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallet_wise/screens/wallet_setup.dart';
import '../widgets/numpad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class pin_retype extends StatefulWidget {
  final String expectedPin;

  const pin_retype({super.key, required this.expectedPin});

  @override
  State<pin_retype> createState() => _pin_retypeState();
}

class _pin_retypeState extends State<pin_retype> {
  final TextEditingController _myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _myController.addListener(_updateIconState);
  }

  @override
  void dispose() {
    _myController.removeListener(_updateIconState);
    _myController.dispose();
    super.dispose();
  }

  Future<void> addUserPin(String pin) async {
    var uID = FirebaseAuth.instance.currentUser?.uid;
    if (uID != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference userDoc = firestore.collection('users').doc(uID);

      try {
        await userDoc.update({
          'pin': pin, // Adds the 'pin' field to the user document
        });
        print("User PIN added successfully.");
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
      print("kuch to masla hai");
    }
  }

  bool isSame() {
    if (widget.expectedPin == _myController.text) {
      return true;
    } else {
      return false;
    }
  }

  void _updateIconState() {
    setState(() {
      // State is updated here, causing a rebuild with the correct icons and colors
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine icons and color inside build to reflect current state
    List<bool> isOutlinedList = [
      _myController.text.isNotEmpty,
      _myController.text.length >= 2,
      _myController.text.length >= 3,
      _myController.text.length == 4,
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF392800),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Re-type your pin",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFFCFCFC),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                IconData iconData = isOutlinedList[index]
                    ? Icons.circle
                    : Icons.circle_outlined;
                Color oc = isOutlinedList[index]
                    ? const Color(0xFFE9AB17)
                    : const Color(0xFFE9AB17).withOpacity(0.57);
                return Icon(iconData, color: oc, size: 32);
              }),
            ),
            const SizedBox(
              height: 70,
            ),
            NumPad(
              buttonSize: 101,
              buttonColor: const Color(0xFFE9AB17),
              iconColor: const Color(0xFFFCFCFC),
              controller: _myController,
              delete: () {
                if (_myController.text.isNotEmpty) {
                  setState(() {
                    _myController.text = _myController.text
                        .substring(0, _myController.text.length - 1);
                  });
                }
              },
              onSubmit: () {
                bool check = isSame();
                if (check == true) {
                  addUserPin(_myController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WalletSetup();
                  }));
                } else {
                  showDialog(
                      context: context,
                      builder: (_) => const AlertDialog(
                            content: Text(
                              "Your pin does not match",
                              style: TextStyle(fontSize: 30),
                            ),
                          ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
