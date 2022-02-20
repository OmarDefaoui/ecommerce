// ignore_for_file: avoid_print

import 'package:ecommerce/services/api_client.dart';
import 'package:ecommerce/utils/server_constants.dart';
import 'package:get/get.dart';

class FavoriteService extends GetxService {
  final ApiClient apiClient;
  FavoriteService({required this.apiClient});

  Future<Response> getFavoriteList() async {
    print('in service get');
    return await apiClient.getData(ServerConstants.FAVORITE_URI);
  }

  Future<Response> addItemToFavorite(Map<dynamic, dynamic> body) async {
    print('in service post');
    return await apiClient.postData(ServerConstants.FAVORITE_URI, body);
  }

  Future<Response> deleteItemFromFavorite(int id) async {
    print('in service delete');
    return await apiClient.deleteData(ServerConstants.FAVORITE_URI, id);
  }
}
