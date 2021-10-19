import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor, textColor;
  final VoidCallback onPressed;
  final double fontSize;
  const CustomButton({
    Key? key,
    required this.text,
    this.backgroundColor = kPrimaryColor,
    this.textColor = Colors.white,
    required this.onPressed,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
          ),
        ),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          color: textColor,
          alignment: Alignment.center,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
