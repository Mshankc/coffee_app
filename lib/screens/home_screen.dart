import 'package:coffee_app/constants/texts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color:
                  Colors.blue.withOpacity(0.5), // 50% opacity for transparency
              borderRadius: BorderRadius.circular(
                  20), // Rounded corners with 20 pixel radius
            ),
            child: const Row(
              children: [
                Icon(Icons.chat_outlined),
                Text(Texts.kAppBarChatText),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        children: [Container()],
      ),
    );
  }
}
