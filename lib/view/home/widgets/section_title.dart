import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const SectionTitle({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'See More',
              style: TextStyle(
                color: kColorGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
