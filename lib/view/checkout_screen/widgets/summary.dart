import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/home/widgets/latest_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<HomeController>(builder: (controller) {
                return LatestProducts(productsList: controller.latestProducts);
              }),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(),
              ),
              const Text(
                'Shipping Address',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Text(
                      '21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, \nVictoria Island, \nLagos, \nNigeria',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.check_circle_rounded,
                    color: kPrimaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Change',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
