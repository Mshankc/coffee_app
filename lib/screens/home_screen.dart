import 'package:coffee_app/components/custom_gridview_tile.dart';
import 'package:coffee_app/constants/colors.dart';
import 'package:coffee_app/constants/image_address.dart';
import 'package:coffee_app/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/appbar_buttons.dart';
import '../components/media_container.dart';
import '../components/home_container.dart';
import '../components/logo_container.dart';
import '../components/product_tile.dart';
import '../models/shop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isExpanded = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
                    // Background image container
                    Container(
                      width: screenSize.width,
                      height: screenSize.height * 1 / 1.4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageAddress.homePage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Main container
                    Positioned(
                      width: screenSize.width * 0.9223,
                      height: screenSize.height * 0.437,
                      right: screenSize.width * 0.0364,
                      bottom: screenSize.height * 0.0328,
                      child: const HomeContainer(),
                    ),
                    // Logo container
                    Positioned(
                      left: screenSize.width * 0.097,
                      top: screenSize.height * 0.186,
                      child: const LogoContainer(),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenSize.height * 0.0328,
                          left: screenSize.width * 0.0485,
                        ),
                        child: Text(
                          AppTexts.kRecommendedText,
                          style: GoogleFonts.darkerGrotesque(
                            fontWeight: FontWeight.w700,
                            fontSize: screenSize.width * 0.097,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenSize.width * 0.0485),
                        child: Text(
                          '$itemNumber items',
                          style: TextStyle(
                            color: AppColors.textColor2,
                            fontSize: screenSize.width * 0.0485,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: screenSize.height * 0.547,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ProductTile(product: product);
                          },
                        ),
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
                const Divider(
                  color: AppColors.dividerColor,
                ),
                Text(
                  '- OUR PRODUCTS -',
                  style: GoogleFonts.darkerGrotesque(
                    color: AppColors.textColor2,
                    fontSize: screenSize.width * 0.068,
                  ),
                ),
                const Divider(
                  color: AppColors.dividerColor,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenSize.width * 0.0485,
                      top: screenSize.height * 0.011,
                    ),
                    child: Text(
                      'All Products',
                      style: GoogleFonts.darkerGrotesque(
                        fontWeight: FontWeight.w700,
                        fontSize: screenSize.width * 0.097,
                      ),
                    ),
                  ),
                ),
                ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                      backgroundColor: Colors.white,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(
                            'Roasted Coffee',
                            style: GoogleFonts.darkerGrotesque(
                              fontSize: screenSize.width * 0.073,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                      body: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.0485,
                        ),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: screenSize.width * 0.012,
                            mainAxisSpacing: screenSize.width * 0.012,
                            crossAxisCount: 2,
                            childAspectRatio: (screenSize.width * 0.5) /
                                (screenSize.height * 0.5),
                          ),
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = products[index];
                            // Replace `condition` with your logic to determine which product is recommended
                            final isRecommended = product.name == 'Kenyan';
                            return CustomGridviewTile(
                              product: product,
                              isRecommended: isRecommended,
                            );
                          },
                        ),
                      ),
                      isExpanded: _isExpanded,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: screenSize.width * 0.04,
            top: screenSize.height * 0.05,
            child: const AppBarButtons(),
          ),
        ],
      ),
    );
  }
}
