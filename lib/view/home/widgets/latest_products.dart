import 'package:ecommerce/controllers/favorite_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/server_constants.dart';
import 'package:ecommerce/view/details_screen/details_screen.dart';
import 'package:ecommerce/view/home/widgets/section_title.dart';
import 'package:ecommerce/view/products_screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LatestProducts extends StatelessWidget {
  final List<ProductModel> productsList;
  const LatestProducts({
    Key? key,
    required this.productsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: 'Latest Product',
          onPressed: () {
            Navigator.pushNamed(
              context,
              ProductsScreen.routeName,
              arguments: ProductsScreenArguments(
                link: ServerConstants.LATEST_PRODUCTS_URI,
              ),
            );
          },
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              productsList.length,
              (index) => LatestProductCard(
                product: productsList[index],
                onTap: () => Navigator.pushNamed(
                  context,
                  DetailsScreen.routeName,
                  arguments: ProductDetailsArguments(
                    product: productsList[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LatestProductCard extends StatelessWidget {
  final ProductModel product;
  final void Function()? onTap;
  const LatestProductCard({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<FavoriteController>();

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: product.id.toString(),
                  child: Image.asset(product.image),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${product.title}\n',
              style: const TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                GetBuilder<FavoriteController>(builder: (controller) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      controller.toggleFavorite(product);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        color: controller.isFavorite(product)
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: controller.isFavorite(product)
                            ? kColorRed
                            : kColorGrey,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
