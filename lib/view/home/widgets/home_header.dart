import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/cart_screen/cart_screen.dart';
import 'package:ecommerce/view/home/widgets/icon_button_with_counter.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //search text input
        Expanded(
          child: Container(
            // width: SizeConfig.screenWidth * 0.6,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search Product',
                prefixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        //cart icon
        IconButtonWithCounter(
          iconPath: 'assets/icons/Cart Icon.svg',
          counterValue: 0,
          onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
        ),
        const SizedBox(width: 8),
        //notifications icon
        IconButtonWithCounter(
          iconPath: 'assets/icons/Bell.svg',
          counterValue: 2,
          onPressed: () {},
        ),
      ],
    );
  }
}
