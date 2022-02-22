// ignore_for_file: avoid_print

import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/services/cart_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartService cartService;
  CartController({required this.cartService});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  final List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;

  int _tempSelected = 0;
  int get tempSelected => _tempSelected;
  set tempSelected(int value) {
    _tempSelected = value;
    try {
      update();
      // ignore: empty_catches
    } catch (e) {}
  }

  int _tempQuantity = 0;
  int get tempQuantity => _tempQuantity;
  set tempQuantity(int value) {
    _tempQuantity = value;
    try {
      update();
      // ignore: empty_catches
    } catch (e) {}
  }

  void getInitialQuantity(ProductModel product) {
    int productIndex = indexOfProductInCart(product);
    tempQuantity = (productIndex >= 0) ? cartList[productIndex].quantity : 0;
    tempSelected =
        (productIndex >= 0) ? cartList[productIndex].selectedColor : 0;
  }

  double get totalPrice {
    double sum = 0;
    for (CartModel item in _cartList) {
      sum += item.quantity * item.product.price;
    }
    return sum;
  }

  bool isProductInCart(ProductModel product) {
    return _cartList.any((item) => item.product.id == product.id);
  }

  int indexOfProductInCart(ProductModel product) {
    return _cartList.indexWhere((item) => item.product.id == product.id);
  }

  void addItemToCart(ProductModel product) {
    if (isProductInCart(product)) {
      // update existing cart item
      int indexProduct = indexOfProductInCart(product);
      _cartList[indexProduct].quantity = _tempQuantity;
      _cartList[indexProduct].selectedColor = _tempSelected;
      CartModel cart = _cartList[indexProduct];

      // update cart item in DB
      _updateItemInCart(cart.toMap(), cart.id);
    } else {
      CartModel cart = CartModel(
        quantity: _tempQuantity,
        selectedColor: _tempSelected,
        product: product,
      );

      // add item to cart in DB
      _addItemToCart(cart.toMap());
    }
  }

  void deleteItemInCart(CartModel cart, int index) {
    _cartList.removeAt(index);
    _deleteItemInCart(cart.id);

    update();
  }

  Future<void> getCartList() async {
    _isLoaded = false;
    print('in controller');
    Response response = await cartService.getCartList();
    print(response.body);
    if (response.statusCode == 200) {
      _cartList.clear();
      (response.body['data']).forEach((v) {
        _cartList.add(CartModel.fromMap(v));
      });

      _isLoaded = true;
      update();
    } else {
      print('in error else');
    }
  }

  Future<void> _addItemToCart(Map<dynamic, dynamic> body) async {
    Response response = await cartService.addItemToCart(body);
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('success add item to cart');

      // add new item to cart locally
      _cartList.add(CartModel.fromMap(response.body['data']));
    } else {
      print('in error add item to cart else');
    }
  }

  Future<void> _updateItemInCart(Map<dynamic, dynamic> body, int id) async {
    Response response = await cartService.updateItemInCart(body, id);
    print(response.body);
    if (response.statusCode == 200) {
      print('success update item in cart');
    } else {
      print('in error update item in cart else');
    }
  }

  Future<void> _deleteItemInCart(int id) async {
    Response response = await cartService.deleteItemInCart(id);
    print(response.body);
    if (response.statusCode == 200) {
      print('success delete item in cart');
    } else {
      print('in error else');
    }
  }
}
