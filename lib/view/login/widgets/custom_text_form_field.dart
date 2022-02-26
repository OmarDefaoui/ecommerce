import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final bool isObscure;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.isObscure = false,
    required this.keyboardType,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator ?? basicValidator,
        maxLines: 1,
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

  String? basicValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }
}
