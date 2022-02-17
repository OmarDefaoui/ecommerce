import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/services/cart_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartService cartService;
  CartController({required this.cartService});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  final List<CartModel> _cartList = [];
  List<dynamic> get cartList => _cartList;

  final Map<String, dynamic> _items = {};

  void addItemToCart(CartModel cart) {
    if (_items.containsValue(cart.product)) {
      // update existing cart item
      _items[cart.id]!.quantity = cart.quantity;

      // update cart item in DB
      _updateItemInCart(cart.toMap(), cart.id);
    } else {
      // add new item to cart
      _items.addAll(cart.toMap());

      // add item to cart in DB
      _addItemToCart(cart.toMap());
    }
  }

  void deleteItemInCart(CartModel cart) {
    _deleteItemInCart(cart.id);
  }

  Future<void> getCartList() async {
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
    if (response.statusCode == 200) {
      print('success add item to cart');
    } else {
      print('in error else');
    }
  }

  Future<void> _updateItemInCart(Map<dynamic, dynamic> body, int id) async {
    Response response = await cartService.updateItemInCart(body, id);
    print(response.body);
    if (response.statusCode == 200) {
      print('success update item in cart');
    } else {
      print('in error else');
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
