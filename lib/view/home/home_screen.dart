import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/utils/enums.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/home/widgets/categories.dart';
import 'package:ecommerce/view/home/widgets/discount_banner.dart';
import 'package:ecommerce/view/home/widgets/home_header.dart';
import 'package:ecommerce/view/home/widgets/latest_products.dart';
import 'package:ecommerce/view/home/widgets/special_offers.dart';
import 'package:ecommerce/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Get.find<HomeController>().getHomeData();
    Get.find<CartController>().getCartList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
            child: GetBuilder<HomeController>(builder: (controller) {
              if (!controller.isLoaded) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                children: [
                  // Home header
                  const HomeHeader(),

                  // Discount banner
                  DiscountBanner(cashbackModel: controller.cashback),

                  // Categories
                  Categories(categoriesList: controller.categories),

                  // Special offers
                  SpecialOffers(
                      globalCategoriesList: controller.globalCategories),
                  const SizedBox(height: 6),

                  // Latest products
                  LatestProducts(productsList: controller.latestProducts),
                ],
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
