import 'package:ecommerce/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final int numOfItem;

  CartModel({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<CartModel> demoCarts = [
  CartModel(product: products[0], numOfItem: 2),
  CartModel(product: products[1], numOfItem: 1),
  CartModel(product: products[3], numOfItem: 1),
];
