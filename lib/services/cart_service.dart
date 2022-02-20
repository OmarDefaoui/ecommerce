// ignore_for_file: avoid_print

import 'package:ecommerce/services/api_client.dart';
import 'package:ecommerce/utils/server_constants.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  final ApiClient apiClient;
  CartService({required this.apiClient});

  Future<Response> getCartList() async {
    print('in service get');
    return await apiClient.getData(ServerConstants.CART_URI);
  }

  Future<Response> addItemToCart(Map<dynamic, dynamic> body) async {
    print('in service post');
    return await apiClient.postData(ServerConstants.CART_URI, body);
  }

  Future<Response> updateItemInCart(Map<dynamic, dynamic> body, int id) async {
    print('in service put');
    return await apiClient.putData(ServerConstants.CART_URI, body, id);
  }

  Future<Response> deleteItemInCart(int id) async {
    print('in service delete');
    return await apiClient.deleteData(ServerConstants.CART_URI, id);
  }
}
