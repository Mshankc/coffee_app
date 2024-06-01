import 'package:coffee_app/components/cart_tile.dart';
import 'package:coffee_app/constants/colors.dart';
import 'package:coffee_app/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  static const id = 'Cart';

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void removeFromCart(BuildContext context, Product product) {
    context.read<Shop>().removeFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor: AppColors.dividerColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text('Your cart is empty'),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return CartTile(
                          imageAddress: item.imageAddress,
                          price: item.price.toString(),
                          name: item.name,
                          onPressed: () {
                            setState(() {
                              removeFromCart(context, item);
                            });
                          },
                          onTap: () {});
                    }),
          ),
        ],
      ),
    );
  }
}
