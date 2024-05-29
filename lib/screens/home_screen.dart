import 'package:coffee_app/components/photo_tile.dart';
import 'package:coffee_app/constants/colors.dart';
import 'package:coffee_app/constants/image_address.dart';
import 'package:coffee_app/constants/texts.dart';
import 'package:coffee_app/models/Photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../components/appbar_buttons.dart';
import '../components/media_container.dart';
import '../components/positioned_container.dart';
import '../components/positioned_logo_container.dart';
import '../components/product_tile.dart';
import '../models/shop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    int itemNumber = products.length;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    //bg image container
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1 / 1.4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageAddress.homePage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //main conatiner
                    const Positioned(
                      width: 380,
                      height: 400,
                      right: 15,
                      bottom: 30,
                      child: HomeContainer(),
                    ),
                    //logo container
                    const Positioned(
                      left: 40,
                      top: 170,
                      child: LogoContainer(),
                    ),
                    // chat conatiner
                    // circular search button
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          AppTexts.kRecommendedText,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          '${itemNumber.toString()} items',
                          style: const TextStyle(
                              color: AppColors.textColor2, fontSize: 20),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 500,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return ProductTile(product: product);
                            }),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: AppColors.dividerColor,
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: PhotoContainer(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            right: 15,
            top: 40,
            child: AppBarButtons(),
          ),
        ],
      ),
    );
  }
}
