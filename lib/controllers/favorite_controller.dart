// ignore_for_file: avoid_print

import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/models/favorite_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/services/favorite_service.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final FavoriteService favoriteService;
  FavoriteController({required this.favoriteService});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  final List<FavoriteModel> _favoriteList = [];
  List<FavoriteModel> get favoriteList => _favoriteList;

  HomeController homeController = Get.find<HomeController>();

  bool isFavorite(ProductModel product) {
    return isProductInFavorite(product);
  }

  void toggleFavorite(ProductModel product) async {
    product.isFavourite = !product.isFavourite;

    if (product.isFavourite) {
      // add item to favorite list
      FavoriteModel favorite = FavoriteModel(product: product);

      // add item to favorite in DB
      await _addItemToFavorite(favorite.toMap());
    } else {
      // delete item from favorite list
      // get existing favorite item
      int indexProduct = indexOfProductInFavorite(product);
      FavoriteModel favorite = _favoriteList[indexProduct];
      _favoriteList.removeAt(indexProduct);

      // delete favorite item from DB
      await _deleteItemFromFavorite(favorite.id);
    }

    update();
    homeController
        .latestProducts[homeController.indexOfProductInLatestProducts(product)]
        .isFavourite = product.isFavourite;
    homeController.update();
  }

  bool isProductInFavorite(ProductModel product) {
    return _favoriteList.any((item) => item.product.id == product.id);
  }

  int indexOfProductInFavorite(ProductModel product) {
    return _favoriteList.indexWhere((item) => item.product.id == product.id);
  }

  void _updateItemsFavoriteValue() {
    List<ProductModel> productsList = homeController.latestProducts;
    for (ProductModel product in productsList) {
      int indexProduct = indexOfProductInFavorite(product);
      if (indexProduct >= 0) {
        productsList[homeController.indexOfProductInLatestProducts(product)]
            .isFavourite = true;
      }
    }
    homeController.update();
  }

  Future<void> getFavoriteList() async {
    print('in controller');
    Response response = await favoriteService.getFavoriteList();
    print(response.body);
    if (response.statusCode == 200) {
      _favoriteList.clear();
      (response.body['data']).forEach((v) {
        _favoriteList.add(FavoriteModel.fromMap(v));
      });

      for (FavoriteModel favorite in _favoriteList) {
        favorite.product.isFavourite = true;
      }

      _isLoaded = true;
      _updateItemsFavoriteValue();
      update();
    } else {
      print('in error else');
    }
  }

  Future<void> _addItemToFavorite(Map<dynamic, dynamic> body) async {
    Response response = await favoriteService.addItemToFavorite(body);
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('success add item to favorite');

      // add new item to favorite locally
      _favoriteList.add(FavoriteModel.fromMap(response.body['data']));
    } else {
      print('in error add item to favorite else');
    }
  }

  Future<void> _deleteItemFromFavorite(int id) async {
    Response response = await favoriteService.deleteItemFromFavorite(id);
    print(response.body);
    if (response.statusCode == 200) {
      print('success delete item in favorite');
    } else {
      print('in error else');
    }
  }
}
