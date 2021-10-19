import 'dart:ui';

import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/start_screens/register_screen.dart';
import 'package:ecommerce/view/widgets/background_scaffold.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundScaffold(
      type: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                const CustomText(
                  text: 'LOGIN',
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                  fontSize: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            'assets/icons/login.svg',
            height: size.height * 0.3,
          ),
          SizedBox(height: size.height * 0.05),
          Form(
            child: Column(
              children: [
                CustomTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Enter your email',
                  onChanged: (value) {},
                ),
                SizedBox(height: size.height * 0.01),
                CustomTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  hintText: 'Enter your Password',
                  isObscure: true,
                  icon: Icons.password,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.05),
          CustomButton(
            text: 'LOGIN',
            onPressed: () {},
          ),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: "Don't have an account? ",
                color: kPrimaryColor,
              ),
              InkWell(
                onTap: () {
                  Get.offAll(const RegisterScreen());
                },
                child: const CustomText(
                  text: 'Sign Up',
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          SizedBox(
            width: size.width * 0.7,
            child: Row(
              children: const [
                Expanded(
                  child: Divider(
                    height: 1.5,
                    color: kPrimaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomText(
                    text: 'OR',
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 1.5,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                onTap: () {},
                iconName: 'google-plus',
              ),
              SocialIcon(
                onTap: () {},
                iconName: 'facebook',
              ),
              SocialIcon(
                onTap: () {},
                iconName: 'twitter',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
