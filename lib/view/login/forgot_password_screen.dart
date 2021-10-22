import 'dart:ui';

import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/login/login_screen.dart';
import 'package:ecommerce/view/login/register_screen.dart';
import 'package:ecommerce/view/widgets/background_scaffold.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundScaffold(
      type: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                  text: 'Forgot Password',
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
          SizedBox(
            width: size.width * 0.8,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your email',
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
            text: 'Continue',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              }
            },
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: const CustomText(
                  text: 'Sign Up',
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Message'),
      content: const Text("Reset password email has been sent successfully."),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false,
            );
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
