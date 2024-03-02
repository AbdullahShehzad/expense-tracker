import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF918C8C),
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
              const SizedBox(
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
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Notification',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
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
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expense Alert',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF292B2D),
                              ),
                            ),
                            Text(
                              'Get Notifications about your expenses',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF6A5931),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      FlutterSwitch(
                        width: 64,
                        height: 34,
                        activeTextColor: Colors.black,
                        activeColor: Color(0xFF392800),
                        inactiveColor: Color(0xFF6A5931).withOpacity(0.65),
                        value: switch1,
                        onToggle: (val) {
                          setState(() {
                            switch1 = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Budget',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF292B2D),
                              ),
                            ),
                            Text(
                              'Get Notifications when your budget is exceeding the limit',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF6A5931),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      FlutterSwitch(
                        width: 64,
                        height: 34,
                        activeTextColor: Colors.black,
                        activeColor: Color(0xFF392800),
                        inactiveColor: Color(0xFF6A5931).withOpacity(0.65),
                        value: switch2,
                        onToggle: (val) {
                          setState(() {
                            switch2 = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tips & Articles',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF292B2D),
                              ),
                            ),
                            Text(
                              'Small & useful pieces of practical financial advice',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF6A5931),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      FlutterSwitch(
                        width: 64,
                        height: 34,
                        activeTextColor: Colors.black,
                        activeColor: Color(0xFF392800),
                        inactiveColor: Color(0xFF6A5931).withOpacity(0.65),
                        value: switch3,
                        onToggle: (val) {
                          setState(() {
                            switch3 = val;
                          });
                        },
                      ),
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
