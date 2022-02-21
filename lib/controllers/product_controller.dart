// ignore_for_file: avoid_print

import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/services/products_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductsService productsService;
  ProductController({required this.productsService});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  final List<ProductModel> _productsList = [];
  List<ProductModel> get productsList => _productsList;

  Future<void> getProductsList() async {
    print('in controller');
    Response response = await productsService.getProductsList();
    print(response.body);
    if (response.statusCode.toString().startsWith('2')) {
      _productsList.clear();
      for (var v in (response.body['data'] as List)) {
        _productsList.add(ProductModel.fromMap(v));
      }

      _isLoaded = true;
      update();
    } else {
      print('in error else');
    }
  }
}
