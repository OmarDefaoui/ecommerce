import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/enums.dart';
import 'package:ecommerce/utils/server_constants.dart';
import 'package:ecommerce/view/favorite_screen/favorite_screen.dart';
import 'package:ecommerce/view/home/home_screen.dart';
import 'package:ecommerce/view/products_screen/products_screen.dart';
import 'package:ecommerce/view/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    if (MenuState.home != selectedMenu) {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    }
                  }),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shopping Bag.svg",
                  color: inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ProductsScreen.routeName,
                    arguments: ProductsScreenArguments(
                      link: ServerConstants.PRODUCTS_URI,
                    ),
                  );
                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                onPressed: () {
                  Navigator.pushNamed(context, FavoriteScreen.routeName);
                },
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/User Icon.svg",
                    color: MenuState.profile == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    if (MenuState.profile != selectedMenu) {
                      Navigator.pushNamed(context, ProfileScreen.routeName);
                    }
                  }),
            ],
          )),
    );
  }
}
