// ignore_for_file: avoid_print

import 'package:ecommerce/controllers/favorite_controller.dart';
import 'package:ecommerce/models/cashback_model.dart';
import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/services/home_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeService homeService;
  HomeController({required this.homeService});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  late UserModel _userModel;
  late CashbackModel _cashbackModel;
  final List<ProductModel> _latestProductsList = [];
  final List<CategoryModel> _categoriesList = [];
  final List<GlobalCategoryModel> _globalCategoriesList = [];

  UserModel get user => _userModel;
  CashbackModel get cashback => _cashbackModel;
  List<ProductModel> get latestProducts => _latestProductsList;
  List<CategoryModel> get categories => _categoriesList;
  List<GlobalCategoryModel> get globalCategories => _globalCategoriesList;

  int indexOfProductInLatestProducts(ProductModel product) {
    return _latestProductsList.indexWhere((item) => item.id == product.id);
  }

  Future<void> getHomeData() async {
    _isLoaded = false;
    print('in controller');
    Response response = await homeService.getHomeData();
    // print(response.body);
    if (response.statusCode == 200) {
      _userModel = UserModel.fromMap(response.body['user']);
      _cashbackModel = CashbackModel.fromMap(response.body['cashback']);

      _latestProductsList.clear();
      _categoriesList.clear();
      _globalCategoriesList.clear();

      for (var v in (response.body['latest_products'] as List)) {
        _latestProductsList.add(ProductModel.fromMap(v));
      }
      for (var v in (response.body['global_categories'] as List)) {
        _globalCategoriesList.add(GlobalCategoryModel.fromMap(v));
        for (var c in (v['categories'] as List)) {
          _categoriesList.add(CategoryModel.fromMap(c));
        }
      }

      _isLoaded = true;
      update();

      Get.find<FavoriteController>().getFavoriteList();
    } else {
      print('in error else');
    }
  }
}
