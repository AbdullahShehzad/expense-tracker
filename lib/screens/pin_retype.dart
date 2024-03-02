import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wise/screens/pin_retype.dart';
import '../widgets/numpad.dart';

class pin_retype extends StatefulWidget {
  final String expectedPin;

  const pin_retype({super.key, required this.expectedPin});

  @override
  State<pin_retype> createState() => _pin_retypeState();
}

class _pin_retypeState extends State<pin_retype> {
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
    } else
      return false;
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
      _myController.text.length >= 1,
      _myController.text.length >= 2,
      _myController.text.length >= 3,
      _myController.text.length == 4,
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF392800),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Re-type your pin",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFFCFCFC),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  IconData iconData = isOutlinedList[index]
                      ? Icons.circle
                      : Icons.circle_outlined;
                  Color oc = isOutlinedList[index]
                      ? Color(0xFFE9AB17)
                      : Color(0xFFE9AB17).withOpacity(0.57);
                  return Icon(iconData, color: oc, size: 32);
                }),
              ),
              SizedBox(
                height: 70,
              ),
              NumPad(
                buttonSize: 101,
                buttonColor: Color(0xFFE9AB17),
                iconColor: Color(0xFFFCFCFC),
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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return pin_retype(expectedPin: _myController.text);
                    // }));
                  } else {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              content: Text(
                                "Your pin does not match",
                                style: const TextStyle(fontSize: 30),
                              ),
                            ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
