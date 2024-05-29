import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../constants/texts.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(AppTexts.kCompanyName, style: kCompanyNameTextStyle),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              AppTexts.kProductTypeName,
              style: TextStyle(color: Colors.grey, fontSize: 18),
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
                  color: AppColors.dividerColor,
                ),
                Container(
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.white, Colors.green.withOpacity(.4)],
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
                linkStyle: TextStyle(fontWeight: FontWeight.w500),
                maxLines: 2,
                style: TextStyle(color: AppColors.textColor2, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: AppColors.dividerColor,
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
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
    );
  }
}
