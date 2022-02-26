import 'package:ecommerce/controllers/checkout_controller.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/home/widgets/latest_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.find<CheckoutController>();

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
                children: [
                  Expanded(
                    child: Text(
                      "${controller.street1}, ${controller.street2}\n${controller.city}\n${controller.state}\n${controller.country}",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.check_circle_rounded,
                    color: kPrimaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  controller.processIndex--;
                },
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
