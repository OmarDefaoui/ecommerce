import 'package:ecommerce/utils/enums.dart';
import 'package:ecommerce/view/profile_screen/widgets/profile_menu.dart';
import 'package:ecommerce/view/profile_screen/widgets/profile_picture.dart';
import 'package:ecommerce/view/track_order_screen/track_order_screen.dart';
import 'package:ecommerce/widgets/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  // order hisytory
  // cards

  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePicture(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "My Cart",
              icon: "assets/icons/Cart Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Orders History",
              icon: "assets/icons/Bell.svg",
              press: () {
                Navigator.pushNamed(
                  context,
                  TrackOrderScren.routeName,
                );
              },
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
