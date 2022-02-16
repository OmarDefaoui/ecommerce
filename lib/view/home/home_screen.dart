import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/utils/enums.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/home/widgets/categories.dart';
import 'package:ecommerce/view/home/widgets/discount_banner.dart';
import 'package:ecommerce/view/home/widgets/home_header.dart';
import 'package:ecommerce/view/home/widgets/popular_products.dart';
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
    // Get.find<ProductController>().getProductsList();
    Get.find<HomeController>().getHomeData();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
            child: Column(
              children: const [
                // Home header
                HomeHeader(),

                // Discount banner
                DiscountBanner(),

                // Categories
                Categories(),

                // Special offers
                SpecialOffers(),
                SizedBox(height: 6),

                // Popular products
                PopularProducts(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
