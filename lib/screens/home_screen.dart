import 'package:coffee_app/components/custom_gridview_tile.dart';
import 'package:coffee_app/components/photo_tile.dart';
import 'package:coffee_app/constants/colors.dart';
import 'package:coffee_app/constants/image_address.dart';
import 'package:coffee_app/constants/texts.dart';
import 'package:coffee_app/models/Photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool _isExpanded = true;
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
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          AppTexts.kRecommendedText,
                          style: GoogleFonts.darkerGrotesque(
                              fontWeight: FontWeight.w700, fontSize: 40),
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
                const Divider(
                  color: AppColors.dividerColor,
                ),
                Text(
                  '- OUR PRODUCTS - ',
                  style: GoogleFonts.darkerGrotesque(
                    color: AppColors.textColor2,
                    fontSize: 28,
                  ),
                ),
                const Divider(
                  color: AppColors.dividerColor,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'All Products',
                      style: GoogleFonts.darkerGrotesque(
                          fontWeight: FontWeight.w700, fontSize: 40),
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
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        );
                      },
                      body: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.5 / 1),
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = products[index];
                            return CustomGridviewTile(product: product);
                          },
                        ),
                      ),
                      isExpanded: _isExpanded,
                    ),
                  ],
                )
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
