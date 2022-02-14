import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/login/widgets/background_scaffold.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/view/login/widgets/custom_text.dart';
import 'package:ecommerce/view/login/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "/register";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email = '', password = '', name = '', phone = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundScaffold(
      type: 3,
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
                    onPressed: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
                const CustomText(
                  text: 'SIGN UP',
                  fontWeight: FontWeight.bold,
                  alignment: Alignment.center,
                  fontSize: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            'assets/icons/signup.svg',
            height: size.height * 0.3,
          ),
          SizedBox(height: size.height * 0.05),
          SizedBox(
            width: size.width * 0.8,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    hintText: 'Enter your name',
                    icon: Icons.person_outline,
                    onSaved: (value) => name = value!,
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          errors.contains(kNamelNullError)) {
                        setState(() {
                          errors.remove(kNamelNullError);
                        });
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty && !errors.contains(kNamelNullError)) {
                        setState(() {
                          errors.add(kNamelNullError);
                        });
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your email',
                    icon: Icons.mail_outline,
                    onSaved: (value) => email = value!,
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          errors.contains(kEmailNullError)) {
                        setState(() {
                          errors.remove(kEmailNullError);
                        });
                      } else if (emailValidatorRegExp.hasMatch(value) &&
                          errors.contains(kInvalidEmailError)) {
                        setState(() {
                          errors.remove(kInvalidEmailError);
                        });
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                        setState(() {
                          errors.add(kEmailNullError);
                        });
                      } else if (value.isNotEmpty &&
                          !emailValidatorRegExp.hasMatch(value) &&
                          !errors.contains(kInvalidEmailError)) {
                        setState(() {
                          errors.add(kInvalidEmailError);
                        });
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: 'Enter your Password',
                    onSaved: (value) => password = value!,
                    isObscure: true,
                    icon: Icons.password,
                    onChanged: (value) {
                      if (value.isNotEmpty && errors.contains(kPassNullError)) {
                        setState(() {
                          errors.remove(kPassNullError);
                        });
                      } else if (!(value.length < 8) &&
                          errors.contains(kShortPassError)) {
                        setState(() {
                          errors.remove(kShortPassError);
                        });
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty && !errors.contains(kPassNullError)) {
                        setState(() {
                          errors.add(kPassNullError);
                        });
                      } else if (value.isNotEmpty &&
                          value.length < 8 &&
                          !errors.contains(kShortPassError)) {
                        setState(() {
                          errors.add(kShortPassError);
                        });
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  Column(
                    children: List.generate(
                      errors.length,
                      (index) => Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Error.svg',
                            height: 14,
                            width: 14,
                          ),
                          const SizedBox(width: 10),
                          CustomText(text: errors[index], color: Colors.red),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          CustomButton(
            text: 'SIGN UP',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          ),
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: "You have an account? ",
                color: kPrimaryColor,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
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
                iconName: 'google-icon',
              ),
              SocialIcon(
                onTap: () {},
                iconName: 'facebook-2',
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
        // padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: kPrimaryColor,
          ),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: const EdgeInsets.all(15),
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/$iconName.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }
}
