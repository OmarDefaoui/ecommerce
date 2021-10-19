import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/widgets/background_scaffold.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundScaffold(
      type: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: 'SIGN UP',
            fontWeight: FontWeight.bold,
            alignment: Alignment.center,
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            'assets/icons/signup.svg',
            height: size.height * 0.35,
          ),
          SizedBox(height: size.height * 0.05),
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
          SizedBox(height: size.height * 0.05),
          CustomButton(
            text: 'SIGN UP',
            onPressed: () {},
          ),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: "Already have an account? ",
                color: kPrimaryColor,
              ),
              InkWell(
                onTap: () {
                  Get.offAll(const LoginScreen());
                },
                child: const CustomText(
                  text: 'Sign In',
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

class SocialIcon extends StatelessWidget {
  final String iconName;
  final Function() onTap;
  const SocialIcon({
    Key? key,
    required this.iconName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: kPrimaryColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          'assets/icons/$iconName.svg',
          height: 20,
          width: 20,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
