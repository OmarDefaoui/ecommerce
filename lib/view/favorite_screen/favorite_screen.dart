import 'package:ecommerce/controllers/favorite_controller.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/details_screen/details_screen.dart';
import 'package:ecommerce/view/favorite_screen/widgets/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  static String routeName = "/favorite";
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Get.find<FavoriteController>().getFavoriteList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Favorite",
              style: TextStyle(color: Colors.black),
            ),
            GetBuilder<FavoriteController>(builder: (controller) {
              return Text(
                "${controller.favoriteList.length} items",
                style: Theme.of(context).textTheme.caption,
              );
            }),
          ],
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: GetBuilder<FavoriteController>(builder: (controller) {
          if (!controller.isLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: controller.favoriteList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(controller.favoriteList[index].product.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  controller
                      .toggleFavorite(controller.favoriteList[index].product);
                },
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: InkWell(
                  child: FavoriteCard(
                      favoriteModel: controller.favoriteList[index]),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: ProductDetailsArguments(
                        product: controller.favoriteList[index].product,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
