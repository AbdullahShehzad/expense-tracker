import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Security extends StatefulWidget {
  final String curr;
  const Security({super.key, required this.curr});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  bool pin = false;
  bool finger = false;
  bool face = false;

  @override
  void initState() {
    isVisibile();
    super.initState();
  }

  void isVisibile() {
    if (widget.curr == "Pin") {
      pin = true;
    } else if (widget.curr == "Fingerprint") {
      finger = true;
    } else if (widget.curr == "Face ID") {
      face = true;
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
            Color(0xFFE9AB17),
            Color(0xFf5D4303),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    color: Colors.black,
                    iconSize: 28, // Size of the icon
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Security',
                    style: TextStyle(
                      color: Colors.black,
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
                    color: Colors.transparent,
                    iconSize: 28, // Size of the icon
                    onPressed: () {
                      print('Icon Button Pressed!');
                    },
                  ),
                ],
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                onPressed: () {
                  pin = true;
                  finger = false;
                  face = false;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Pin',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      pin == true
                          ? const Icon(
                              Icons.check_circle,
                              color: Color(0xFF392800),
                              size: 24,
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                onPressed: () {
                  pin = false;
                  finger = true;
                  face = false;

                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Fingerprint',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      finger == true
                          ? const Icon(
                              Icons.check_circle,
                              color: Color(0xFF392800),
                              size: 24,
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                onPressed: () {
                  pin = false;
                  finger = false;
                  face = true;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Face',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      face == true
                          ? const Icon(
                              Icons.check_circle,
                              color: Color(0xFF392800),
                              size: 24,
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
