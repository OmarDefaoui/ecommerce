import 'package:ecommerce/services/api_client.dart';
import 'package:ecommerce/utils/server_constants.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  final ApiClient apiClient;
  CartService({required this.apiClient});

  Future<Response> getCartList() async {
    print('in service');
    return await apiClient.getData(ServerConstants.CART_URI);
  }
}
