import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_wise/constants/constants.dart';
import 'package:wallet_wise/screens/budget_screen.dart';
import 'package:wallet_wise/screens/home_screen.dart';
import 'package:wallet_wise/screens/profile_screen.dart';
import 'package:wallet_wise/screens/transactions_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _kBottomNavigationBarSelectedIndex = 0;

  final iconList = [
    'assets/home-icon.svg',
    'assets/transaction-icon.svg',
    'assets/budget-icon.svg',
    'assets/profile-icon.svg',
  ];

  final iconNames = [
    'Home',
    'Transactions',
    'Budget',
    'Profile',
  ];

  final pages = [
    const HomeScreen(),
    const TransactionsScreen(),
    const BudgetScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_kBottomNavigationBarSelectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kYellowColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        tabBuilder: (int index, bool isActive) {
          return Column(
            children: [
              SvgPicture.asset(
                iconList[index],
                width: 24,
                color: isActive ? kYellowColor : const Color(0xFFC6C6C6),
              ),
              Text(
                iconNames[index],
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  color: isActive ? kYellowColor : const Color(0xFFC6C6C6),
                ),
              ),
            ],
          );
        },
        activeIndex: _kBottomNavigationBarSelectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) =>
            setState(() => _kBottomNavigationBarSelectedIndex = index),
        //other params
      ),
    );
  }
}
