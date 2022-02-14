import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: kColorPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: 'A summer Surprise\n'),
            TextSpan(
              text: 'Cashback 20%',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
