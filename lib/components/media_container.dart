import 'package:coffee_app/components/photo_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import '../constants/texts.dart';
import '../models/Photos.dart';

class PhotoContainer extends StatelessWidget {
  const PhotoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1 / 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.dividerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: AppColors.accentColor,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 100, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppTexts.kInstagramId),
                        Text('${AppTexts.kInstagramFollowrs} followers')
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text(
                      'More photos',
                      style: TextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 1 / 1.3,
              height: MediaQuery.of(context).size.width * 1 / 5,
              child: ListView.builder(
                  itemCount: photoList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: PhotoTile(photoAddress: photoList[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
