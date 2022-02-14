import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/routes.dart';
import 'package:ecommerce/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/helper/dependencies.dart' as dep;
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          titleTextStyle: TextStyle(color: Color(0xff8b8b8b)),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
