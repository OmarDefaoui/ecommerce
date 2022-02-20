// ignore_for_file: avoid_print

import 'package:ecommerce/services/api_client.dart';
import 'package:ecommerce/utils/server_constants.dart';
import 'package:get/get.dart';

class HomeService extends GetxService {
  final ApiClient apiClient;
  HomeService({required this.apiClient});

  Future<Response> getHomeData() async {
    print('in service');
    return await apiClient.getData(ServerConstants.HOME_URI);
  }
}
