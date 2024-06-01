import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:coffee_app/constants/colors.dart';
import 'package:coffee_app/screens/Cart.dart';
import 'package:coffee_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});
  static const id = 'introScreen';

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List _pages = [
    const HomeScreen(),
    const Cart(),
  ];
  int _currentIndex = 0;
  void Navigate(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        shadow: Shadow(color: AppColors.dividerColor, blurRadius: 10),
        activeColor: AppColors.accentColor,
        inactiveColor: AppColors.dividerColor,
        activeIndex: _currentIndex,
        onTap: Navigate,
        gapWidth: 10,
        iconSize: MediaQuery.of(context).size.width * 1 / 20,
        icons: const [
          FontAwesomeIcons.houseUser,
          FontAwesomeIcons.cartShopping
        ],
      ),
    );
  }
}
