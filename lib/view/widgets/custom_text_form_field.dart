import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool isObscure;
  final TextInputType keyboardType;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.isObscure = false,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(icon, color: kPrimaryColor),
          suffixIcon: isObscure
              ? const Icon(Icons.visibility, color: kPrimaryColor)
              : const SizedBox.shrink(),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
