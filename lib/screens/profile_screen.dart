import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      "Muhammad Saad",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF222222),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Color(0xFFE9AB17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.group_add_rounded,
                            color: Color(0xFF392800),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "Invite Friends",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF000000),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Color(0xFF6A5931).withOpacity(.35),
                    ),
                    Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Color(0xFFE9AB17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: Color(0xFF392800),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF000000),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Color(0xFF6A5931).withOpacity(.35),
                    ),
                    Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Color(0xFFE9AB17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.help,
                            color: Color(0xFF392800),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          "Customer Support",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF000000),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: Color(0xFF6A5931).withOpacity(.35),
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
