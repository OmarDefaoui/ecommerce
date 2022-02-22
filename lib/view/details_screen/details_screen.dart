import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/details_screen/widgets/color_dots.dart';
import 'package:ecommerce/view/details_screen/widgets/custom_appbar.dart';
import 'package:ecommerce/view/details_screen/widgets/product_description.dart';
import 'package:ecommerce/view/details_screen/widgets/product_images.dart';
import 'package:ecommerce/widgets/default_button.dart';
import 'package:ecommerce/widgets/top_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    final ProductModel product = agrs.product;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: product.rating),
      ),
      body: ListView(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: product),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: product),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child:
                              GetBuilder<CartController>(builder: (controller) {
                            return DefaultButton(
                              text: "Add To Cart",
                              press: () {
                                Get.find<CartController>()
                                    .addItemToCart(product);
                                Navigator.pop(context);
                              },
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsArguments {
  final ProductModel product;

  ProductDetailsArguments({required this.product});
}
