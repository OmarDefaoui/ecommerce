import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/widgets/rounded_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getInitialQuantity(product);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: GetBuilder<CartController>(builder: (controller) {
        return Row(
          children: [
            ...List.generate(
              product.colors.length,
              (index) => InkWell(
                child: ColorDot(
                  color: Color(product.colors[index]),
                  isSelected: index == controller.tempSelected,
                ),
                onTap: () {
                  controller.tempSelected = index;
                },
              ),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundedIconBtn(
                  icon: Icons.remove,
                  press: () {
                    if (controller.tempQuantity > 0) {
                      controller.tempQuantity--;
                    }
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                Text(
                  controller.tempQuantity.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                RoundedIconBtn(
                  icon: Icons.add,
                  showShadow: true,
                  press: () {
                    controller.tempQuantity++;
                  },
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
