import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    'transaction-icon.svg',
    'budget-icon.svg',
    'profile-icon.svg',
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        tabBuilder: (int index, bool isActive) {
          return SvgPicture.asset(
            iconList[index],
            width: 24,
            color: isActive ? kYellowColor : const Color(0xFFC6C6C6),
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
