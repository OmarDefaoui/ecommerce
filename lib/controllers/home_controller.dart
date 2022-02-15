import 'package:ecommerce/models/cashback_model.dart';
import 'package:ecommerce/models/product_model_1.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/services/home_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeService homeService;
  HomeController({required this.homeService});

  late UserModel _userModel;
  late CashbackModel _cashbackModel;
  final List<ProductModel> _popularProductsList = [];
  final List<Category> _categoriesList = [];
  final List<GlobalCategory> _globalCategoriesList = [];

  UserModel get user => _userModel;
  CashbackModel get cashback => _cashbackModel;
  List<ProductModel> get popularProducts => _popularProductsList;
  List<Category> get categories => _categoriesList;
  List<GlobalCategory> get globalCategories => _globalCategoriesList;

  Future<void> getHomeData() async {
    print('in controller');
    Response response = await homeService.getHomeData();
    print(response.body);
    if (response.statusCode == 200) {
      _userModel = UserModel.fromMap(response.body['user']);
      _cashbackModel = CashbackModel.fromMap(response.body['cashback']);

      _popularProductsList.clear();
      _categoriesList.clear();
      _globalCategoriesList.clear();

      (response.body['popular_products']).forEach((v) {
        _popularProductsList.add(ProductModel.fromMap(v));
      });
      (response.body['categories']).forEach((v) {
        _categoriesList.add(Category.fromMap(v));
      });
      (response.body['global_categories']).forEach((v) {
        _globalCategoriesList.add(GlobalCategory.fromMap(v));
      });

      update();
    } else {
      print('in error else');
    }
  }
}
