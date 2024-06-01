import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class CartTile extends StatelessWidget {
  CartTile({
    super.key,
    required this.imageAddress,
    required this.price,
    required this.name,
    required this.onPressed,
    required this.onTap,
  });
  final String imageAddress;
  final String price;
  final String name;
  VoidCallback? onPressed, onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.dividerColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imageAddress,
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.darkerGrotesque(
                          fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                    const Text(
                      'Whole Beans',
                      style: TextStyle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      price,
                      style: GoogleFonts.darkerGrotesque(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.red,
                    )),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFD7FFDA),
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width * 1 / 1.2,
                  child: Center(
                    child: Text(
                      'Proceed to Checkout',
                      style: GoogleFonts.darkerGrotesque(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF00C212),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
