import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/cart_screen/widgets/cart_card.dart';
import 'package:ecommerce/view/cart_screen/widgets/checkout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            GetBuilder<CartController>(builder: (controller) {
              return Text(
                "${controller.cartList.length} items",
                style: Theme.of(context).textTheme.caption,
              );
            }),
          ],
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: GetBuilder<CartController>(builder: (controller) {
          if (!controller.isLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: controller.cartList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(controller.cartList[index].product.id.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  // setState(() {
                  controller.cartList.removeAt(index);
                  // });
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
                child: CartCard(cart: controller.cartList[index]),
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
