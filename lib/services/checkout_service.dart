// ignore_for_file: avoid_print

import 'package:ecommerce/services/api_client.dart';
import 'package:get/get.dart';

class CheckoutService extends GetxService {
  final ApiClient apiClient;
  CheckoutService({required this.apiClient});
}
