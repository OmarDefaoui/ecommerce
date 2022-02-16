import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/services/cart_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartService cartService;
  CartController({required this.cartService});

  final List<CartModel> _cartList = [];
  List<dynamic> get cartList => _cartList;

  final Map<int, CartModel> _items = {};

  void addItemToCart(ProductModel product) {
    if (_items.containsValue(product)) {
      int num = _items[product.id]!.numOfItem + 1;
      _items.addAll({
        product.id: CartModel(product: product, numOfItem: num),
      });
    } else {
      _items.addAll({
        product.id: CartModel(product: product, numOfItem: 1),
      });
    }
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
      update();
    } else {
      print('in error else');
    }
  }
}
