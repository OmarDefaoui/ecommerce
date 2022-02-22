import 'package:ecommerce/controllers/favorite_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/details_screen/widgets/expanded_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Get.find<FavoriteController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: ExpandedText(text: product.description),
              ),
            ),
            GetBuilder<FavoriteController>(builder: (controller) {
              return InkWell(
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  width: getProportionateScreenWidth(64),
                  decoration: BoxDecoration(
                    color: controller.isFavorite(product)
                        ? const Color(0xFFFFE6E6)
                        : const Color(0xFFF5F6F9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: controller.isFavorite(product)
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                    height: getProportionateScreenWidth(16),
                  ),
                ),
                onTap: () {
                  controller.toggleFavorite(product);
                },
              );
            }),
          ],
        ),
      ],
    );
  }
}
