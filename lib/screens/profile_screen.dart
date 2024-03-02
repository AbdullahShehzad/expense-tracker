import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallet_wise/screens/profile_settings.dart';

import 'chat_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF392800),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
              ),
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
                    'Profile',
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
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      "Muhammad Saad",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Color(0xFF392800),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Color(0xFFE9AB17),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Color(0xFFE9AB17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.group_add_rounded,
                              color: Color(0xFF392800),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            "Invite Friends",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF000000),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xFF6A5931).withOpacity(.35),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileSettings(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Color(0xFFE9AB17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.settings,
                              color: Color(0xFF392800),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF000000),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xFF6A5931).withOpacity(.35),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        User? user = _auth.currentUser;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              userId: user!.uid,
                            ),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Color(0xFFE9AB17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.help,
                              color: Color(0xFF392800),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          const Text(
                            "Customer Support",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF000000),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: const Color(0xFF6A5931).withOpacity(.35),
                    )
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
