import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppBarButtons extends StatelessWidget {
  const AppBarButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          GestureDetector(
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
          const SizedBox(
            width: 5,
          ),
          Container(
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
        ],
      ),
    );
  }
}
