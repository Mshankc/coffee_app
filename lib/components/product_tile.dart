import 'package:coffee_app/constants/colors.dart';
import 'package:coffee_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        child: Container(
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.asset(
                  product.imageAddress,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: GoogleFonts.darkerGrotesque(
                          fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '3 Weights & 4 Grind Options',
                      style: GoogleFonts.darkerGrotesque(
                          color: AppColors.textColor2,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 2),
                    ),
                    Text(
                      '\$ ${product.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Flexible(
                child: Center(
                  heightFactor: 1,
                  child: Divider(
                    color: AppColors.dividerColor,
                    indent: 50,
                    endIndent: 50,
                  ),
                ),
              ),
              Flexible(
                child: Center(
                  heightFactor: 2,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: AppColors.accentColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
