import 'package:coffee_app/constants/colors.dart';
import 'package:coffee_app/constants/image_address.dart';
import 'package:coffee_app/constants/text_styles.dart';
import 'package:coffee_app/constants/texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Stack(
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
                  Positioned(
                    width: 380,
                    height: 400,
                    right: 15,
                    bottom: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(AppTexts.kCompanyName,
                                style: kCompanyNameTextStyle),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              AppTexts.kProductTypeName,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: AppColors.accentColor,
                                ),
                                const Text(AppTexts.kUserFavourites),
                                const Divider(
                                  indent: 5,
                                  endIndent: 10,
                                ),
                                Container(
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.white,
                                        Colors.green.withOpacity(.4)
                                      ],
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.star_sharp,
                                        color: AppColors.starColor,
                                      ),
                                      Text('Star Seller on '),
                                      Text(
                                        'minis',
                                        style: TextStyle(
                                            color: AppColors.starColor,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Flexible(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: ExpandableText(
                                AppTexts.kAppDescription,
                                expandText: 'read more',
                                collapseText: 'show less',
                                linkColor: AppColors.accentColor,
                                linkStyle:
                                    TextStyle(fontWeight: FontWeight.w500),
                                maxLines: 2,
                                style: TextStyle(
                                    color: AppColors.textColor2, fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.grey,
                            indent: 40,
                            endIndent: 40,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: AppColors.accentColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Get delivery location',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.accentColor,
                                    size: 14,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Delivery fee will apply',
                              style: TextStyle(color: Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //logo container
                  Positioned(
                    left: 40,
                    top: 170,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          ImageAddress.appLogo,
                          scale: 1.3,
                        ),
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       image: const DecorationImage(
                    //           image: AssetImage('images/katandkinlogo.jpg')),
                    //       borderRadius: BorderRadius.circular(25)),
                    // ),
                  ),
                  // chat conatiner
                  Positioned(
                    width: 100,
                    height: 50,
                    right: 70,
                    top: 40,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black12.withOpacity(0.4)),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.chat_outlined,
                                size: 30,
                                color: AppColors.actionColor,
                              ),
                              Text(
                                'Chat',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: AppColors.actionColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // circular search button
                  Positioned(
                    width: 50,
                    height: 50,
                    right: 15,
                    top: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12.withOpacity(0.4),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: AppColors.actionColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 400,
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductTile(product: product);
                  }),
            ),
            Container(
              color: Colors.blue,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
