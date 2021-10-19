import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/start_screens/login_screen.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  PageController pageViewController = PageController(initialPage: 0);
  List<Map<String, String>> splashData = [
    {
      'text': "Welcome to TOKOTO, Let's shop!",
      'imageName': 'splash_1',
    },
    {
      'text': "We help people connect with store\naround the world",
      'imageName': 'splash_2',
    },
    {
      'text': "We show the easy way to shop.\nJust stay at home with us",
      'imageName': 'splash_3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageViewController,
                itemCount: splashData.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text']!,
                  imageName: splashData[index]['imageName']!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const Spacer(flex: 3),
                  CustomButton(
                    text: currentPage == splashData.length - 1
                        ? 'Continue'
                        : 'Next',
                    fontSize: 16,
                    onPressed: () {
                      if (currentPage == splashData.length - 1) {
                        Get.offAll(const LoginScreen());
                      } else {
                        setState(() {
                          pageViewController.animateToPage(
                            currentPage + 1,
                            duration: kAnimationDuration,
                            curve: Curves.ease,
                          );
                        });
                      }
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  final String text, imageName;
  const SplashContent({
    Key? key,
    required this.text,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        CustomText(
          text: 'TOKOTO',
          fontSize: getProportionateScreenWidth(36),
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          alignment: Alignment.center,
        ),
        CustomText(
          text: text,
          alignment: Alignment.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          'assets/images/$imageName.png',
          height: getProportionateScreenHeight(256),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
