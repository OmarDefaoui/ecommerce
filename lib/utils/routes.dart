import 'package:ecommerce/view/cart_screen/cart_screen.dart';
import 'package:ecommerce/view/checkout_screen/checkout_screen.dart';
import 'package:ecommerce/view/details_screen/details_screen.dart';
import 'package:ecommerce/view/favorite_screen/favorite_screen.dart';
import 'package:ecommerce/view/home/home_screen.dart';
import 'package:ecommerce/view/login/forgot_password_screen.dart';
import 'package:ecommerce/view/login/login_screen.dart';
import 'package:ecommerce/view/login/onboarding_screen.dart';
import 'package:ecommerce/view/login/register_screen.dart';
import 'package:ecommerce/view/products_screen/products_screen.dart';
import 'package:ecommerce/view/profile_screen/profile_screen.dart';
import 'package:ecommerce/view/track_order_screen/track_order_screen.dart';
import 'package:ecommerce/view/track_order_screen/tracking_details_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  CheckoutScreen.routeName: (context) => const CheckoutScreen(),
  TrackOrderScren.routeName: (context) => const TrackOrderScren(),
  TrackingDetailsScreen.routeName: (context) => const TrackingDetailsScreen(),
  FavoriteScreen.routeName: (context) => const FavoriteScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
};
