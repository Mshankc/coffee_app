import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(AppTexts.kCompanyName,
                style: AppTextStyle.kCompanyNameTextStyle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              AppTexts.kProductTypeName,
              style: AppTextStyle.kProductTypeTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite,
                  color: AppColors.accentColor,
                ),
                Text(
                  AppTexts.kUserFavourites,
                  style: GoogleFonts.darkerGrotesque(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
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
                      Text(AppTexts.kStarText1),
                      Text(
                        AppTexts.kStarText2,
                        style: TextStyle(
                            color: AppColors.starColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ExpandableText(
                AppTexts.kAppDescription,
                expandText: 'read more',
                collapseText: 'show less',
                linkColor: AppColors.accentColor,
                linkStyle: const TextStyle(fontWeight: FontWeight.w500),
                maxLines: 2,
                style: AppTextStyle.kExpandDescriptionTextStyle,
              ),
            ),
          ),
          const Divider(
            color: AppColors.dividerColor,
            indent: 40,
            endIndent: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: AppColors.accentColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Get delivery location',
                      style: GoogleFonts.darkerGrotesque(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.accentColor,
                      size: 14,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              'Delivery fee will apply',
              style: GoogleFonts.darkerGrotesque(
                  color: AppColors.textColor2, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
