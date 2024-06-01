import 'package:coffee_app/constants/colors.dart';
import 'package:coffee_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  static const id = 'Cart';

  void removeFromCart(BuildContext context, Product product) {}

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor: AppColors.dividerColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cart',
            style: GoogleFonts.darkerGrotesque(
                fontWeight: FontWeight.w800,
                fontSize: MediaQuery.of(context).size.width * 1 / 10),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.dividerColor),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                item.imageAddress,
                                height: 120,
                                width: 120,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(item.name),
                            Text(
                              'Whole Beans',
                              style: TextStyle(),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
