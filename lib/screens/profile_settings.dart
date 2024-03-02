import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wise/screens/security.dart';

import 'currency.dart';
import 'language.dart';
import 'notification_screen.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  String currencyString = "USD";
  String language = "English";
  String theme = "Dark";
  String security = "Fingerprint";

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
                    'Settings',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Currency(curr: currencyString),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Currency',
                          style: TextStyle(
                            color: Color(0xFF392800),
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'USD',
                              style: TextStyle(
                                color: Color(0xFF392800),
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0xFF392800),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Language(lang: language),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Language',
                          style: TextStyle(
                            color: Color(0xFF392800),
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'English',
                              style: TextStyle(
                                color: Color(0xFF392800),
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0xFF392800),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Theme',
                          style: TextStyle(
                            color: Color(0xFF392800),
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Dark',
                              style: TextStyle(
                                color: Color(0xFF392800),
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0xFF392800),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Security(curr: security),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Security',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Fingerprint',
                            style: TextStyle(
                              color: Color(0xFF392800),
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Color(0xFF392800),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notifications(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notifications',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: Color(0xFF392800),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Color(0xFF392800).withOpacity(.38),
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(
                            color: Color(0xFF392800),
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: Color(0xFF392800),
                        ),
                      ],
                    ),
                  )),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Help',
                        style: TextStyle(
                          color: Color(0xFF392800),
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: Color(0xFF392800),
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
