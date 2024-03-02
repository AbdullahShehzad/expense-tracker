import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wise/screens/wallet_setup.dart';
import '../widgets/numpad.dart';

class PinRetype extends StatefulWidget {
  final String expectedPin;

  const PinRetype({super.key, required this.expectedPin});

  @override
  State<PinRetype> createState() => _PinRetypeState();
}

class _PinRetypeState extends State<PinRetype> {
  final TextEditingController _myController = TextEditingController();
  bool _isFieldEmpty = true;

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

  bool isSame() {
    if (widget.expectedPin == _myController.text) {
      return true;
    } else {
      return false;
    }
  }

  void _updateIconState() {
    var txt = _myController.text;
    bool isNowEmpty = txt.isEmpty;

    setState(() {
      _isFieldEmpty = isNowEmpty;
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WalletSetup(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => const AlertDialog(
                      content: Text(
                        "Your pin does not match",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
