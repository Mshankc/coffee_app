import 'package:coffee_app/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class CustomGridviewTile extends StatelessWidget {
  const CustomGridviewTile({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  product.imageAddress,
                  fit: BoxFit.fill,
                  height: 180,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.darkerGrotesque(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
                Text(
                  '3 Weights & 4 Grind Options',
                  style: GoogleFonts.darkerGrotesque(
                      color: AppColors.textColor2,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 2),
                ),
                Text(
                  '\$ ${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Center(
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.dividerColor),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: const Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
