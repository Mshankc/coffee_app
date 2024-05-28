import 'package:coffee_app/constants/image_address.dart';
import 'package:coffee_app/models/products.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: 'Kenyan',
        price: 1600,
        description:
            'Kenyan coffee, which boasts aromas of walnuts and honey, with flavors of green apple, baker’s chocolate, and berries',
        imageAddress: ImageAddress.kenyaProduct),
    Product(
        name: 'Cauvery',
        price: 600,
        description:
            'Kenyan coffee, which boasts aromas of walnuts and honey, with flavors of green apple, baker’s chocolate, and berries',
        imageAddress: ImageAddress.cauvaryProduct),
    Product(
        name: 'Costa Rican',
        price: 800,
        description:
            'Kenyan coffee, which boasts aromas of walnuts and honey, with flavors of green apple, baker’s chocolate, and berries',
        imageAddress: ImageAddress.costaricaProduct),
    Product(
        name: 'Mansoon Malabari',
        price: 1200,
        description:
            'Kenyan coffee, which boasts aromas of walnuts and honey, with flavors of green apple, baker’s chocolate, and berries',
        imageAddress: ImageAddress.mansoonProduct),
    Product(
        name: 'Codes Natural',
        price: 600,
        description:
            'Kenyan coffee, which boasts aromas of walnuts and honey, with flavors of green apple, baker’s chocolate, and berries',
        imageAddress: ImageAddress.kodaiProduct),
    Product(
        name: 'Shield Tail',
        price: 1000,
        description:
            'Kenyan coffee, which boasts aromas of walnuts and honey, with flavors of green apple, baker’s chocolate, and berries',
        imageAddress: ImageAddress.sheildtailProduct),
    Product(
        name: 'South Indian',
        price: 600,
        description:
            'Kenyan coffee, which boasts aromas of walnuts and honey, with flavors of green apple, baker’s chocolate, and berries',
        imageAddress: ImageAddress.southindianProduct)
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
