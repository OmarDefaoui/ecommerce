import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/services/api_client.dart';
import 'package:ecommerce/services/cart_service.dart';
import 'package:ecommerce/services/home_service.dart';
import 'package:ecommerce/services/products_service.dart';
import 'package:ecommerce/utils/server_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: ServerConstants.BASE_URL));

  // services
  Get.lazyPut(() => HomeService(apiClient: Get.find()));
  Get.lazyPut(() => ProductsService(apiClient: Get.find()));
  Get.lazyPut(() => CartService(apiClient: Get.find()));

  // controllers
  Get.lazyPut(() => HomeController(homeService: Get.find()));
  Get.lazyPut(() => ProductController(productsService: Get.find()));
  Get.lazyPut(() => CartController(cartService: Get.find()));
}
