import 'package:coffee_app/models/products.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(product.imageAddress),
          Text(product.name),
          Text(product.price.toString()),
          SizedBox(),
          TextButton(
            onPressed: () {},
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
