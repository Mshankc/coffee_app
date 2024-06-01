import 'package:coffee_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';
import '../models/circular_bottomright_clipper.dart';

class CustomGridviewTile extends StatelessWidget {
  const CustomGridviewTile({
    super.key,
    required this.product,
    this.isRecommended = false,
  });

  final Product product;
  final bool isRecommended;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
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
              if (isRecommended)
                Positioned(
                  top: 4.5,
                  left: 4.6,
                  child: ClipPath(
                    clipper: CircularBottomRightClipper(),
                    child: Container(
                      color: AppColors.accentColor,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recommended',
                        style: GoogleFonts.darkerGrotesque(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
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
