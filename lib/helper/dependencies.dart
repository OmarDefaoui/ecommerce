import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/services/api_client.dart';
import 'package:ecommerce/services/products_service.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: 'http://127.0.0.1:8000/api'));

  // services
  Get.lazyPut(() => ProductsService(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => ProductController(productsService: Get.find()));
}
