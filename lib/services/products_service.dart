// ignore_for_file: avoid_print

import 'package:ecommerce/services/api_client.dart';
import 'package:get/get.dart';

class ProductsService extends GetxService {
  final ApiClient apiClient;
  ProductsService({required this.apiClient});

  Future<Response> getProductsList(String link) async {
    print('in service');
    return await apiClient.getData(link);
  }
}
