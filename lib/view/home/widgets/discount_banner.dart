import 'package:ecommerce/models/cashback_model.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  final CashbackModel cashbackModel;
  const DiscountBanner({
    Key? key,
    required this.cashbackModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.only(top: 24, bottom: 18),
      decoration: BoxDecoration(
        color: kColorPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            TextSpan(text: '${cashbackModel.title}\n'),
            TextSpan(
              text: '${cashbackModel.body} ${cashbackModel.pourcentage}%',
              style: const TextStyle(
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
