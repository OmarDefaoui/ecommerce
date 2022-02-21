import 'package:ecommerce/controllers/product_controller.dart';
import 'package:ecommerce/view/details_screen/details_screen.dart';
import 'package:ecommerce/view/home/widgets/home_header.dart';
import 'package:ecommerce/view/products_screen/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = "/products";
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().getProductsList();

    return Scaffold(
      // appBar: const PreferredSize(
      //   child: HomeHeader(),
      //   preferredSize: Size.fromHeight(50.0),
      // ),
      appBar: AppBar(
        title: const HomeHeader(),
        elevation: 0.5,
      ),
      body: GetBuilder<ProductController>(builder: (controller) {
        if (!controller.isLoaded) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.productsList.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
                product: controller.productsList[index],
                onTap: () => Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: ProductDetailsArguments(
                        product: controller.productsList[index],
                      ),
                    ));
          },
        );
      }),
    );
  }
}
