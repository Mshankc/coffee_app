import 'package:coffee_app/constants/colors.dart';
import 'package:coffee_app/models/shop.dart';
import 'package:coffee_app/screens/about_screen.dart';
import 'package:coffee_app/screens/Cart.dart';
import 'package:coffee_app/screens/home_screen.dart';
import 'package:coffee_app/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context) => Shop(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        AboutScreen.id: (context) => const AboutScreen(),
        Cart.id: (context) => const Cart(),
        IntroScreen.id: (context) => const IntroScreen(),
      },
    );
  }
}
