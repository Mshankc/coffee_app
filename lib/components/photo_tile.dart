import 'package:flutter/material.dart';

class PhotoTile extends StatelessWidget {
  const PhotoTile({super.key, required this.photoAddress});
  final String photoAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          photoAddress,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
