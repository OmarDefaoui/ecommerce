import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/cart_screen/widgets/cart_card.dart';
import 'package:ecommerce/view/cart_screen/widgets/checkout_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(demoCarts[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
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
              child: CartCard(cart: demoCarts[index]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
