import 'package:ecommerce/controllers/checkout_controller.dart';
import 'package:ecommerce/status_change/component/connect_indicator.dart';
import 'package:ecommerce/status_change/component/indicators.dart';
import 'package:ecommerce/status_change/component/status_change_tile_builder.dart';
import 'package:ecommerce/status_change/status_view.dart';
import 'package:ecommerce/status_change/theme/connect_indicator_theme.dart';
import 'package:ecommerce/status_change/theme/status_change_theme.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/enums.dart';
import 'package:ecommerce/view/checkout_screen/widgets/add_address.dart';
import 'package:ecommerce/view/checkout_screen/widgets/delevery_time.dart';
import 'package:ecommerce/view/checkout_screen/widgets/finish_view.dart';
import 'package:ecommerce/view/checkout_screen/widgets/summary.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  static String routeName = "/checkout";
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    Get.find<CheckoutController>().initt();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // step indicator
          SizedBox(
            height: 160,
            width: double.maxFinite,
            child: GetBuilder<CheckoutController>(builder: (controller) {
              return StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme:
                      const ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                      MediaQuery.of(context).size.width /
                      controller.processes.length,
                  contentWidgetBuilder: (context, index) {
                    return const Visibility(
                      visible: false,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    );
                  },
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        controller.processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= controller.processIndex) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: kPrimaryColor, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: controller.todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == controller.processIndex) {
                        final prevColor = controller.getColor(index - 1);
                        final color = controller.getColor(index);
                        List<Color> gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)!
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: controller.getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: controller.processes.length,
                ),
              );
            }),
          ),

          // currently opened page
          GetBuilder<CheckoutController>(builder: (controller) {
            return controller.pages == CheckoutPages.deliveryTime
                ? const DeliveryTime()
                : controller.pages == CheckoutPages.addAddress
                    ? const AddAddress()
                    : const Summary();
          }),

          // previous and next button
          Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<CheckoutController>(builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: controller.processIndex > 0,
                    child: CustomButton(
                      text: 'Previous',
                      backgroundColor: Colors.white,
                      textColor: kPrimaryColor,
                      borderSide: const BorderSide(
                        color: kPrimaryColor,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      widthMultiplyPer: 0.4,
                      onPressed: () {
                        controller.processIndex--;

                        switch (controller.processIndex) {
                          case 0:
                            controller.pages = CheckoutPages.deliveryTime;
                            break;
                          case 1:
                            controller.pages = CheckoutPages.addAddress;
                            break;
                          case 2:
                            controller.pages = CheckoutPages.summary;
                            break;
                        }
                      },
                    ),
                  ),
                  CustomButton(
                    text: controller.processIndex == controller.processes.length
                        ? 'Confirm'
                        : 'Next',
                    widthMultiplyPer: 0.4,
                    onPressed: () {
                      if (controller.pages == CheckoutPages.addAddress) {
                        // save entred address info
                        // Validate returns true if the form is valid, or false otherwise.
                        if (!controller.formKey.currentState!.validate()) {
                          return;
                        }
                      }

                      controller.processIndex++;

                      switch (controller.processIndex) {
                        case 0:
                          controller.pages = CheckoutPages.deliveryTime;
                          break;
                        case 1:
                          controller.pages = CheckoutPages.addAddress;
                          break;
                        case 2:
                          controller.pages = CheckoutPages.summary;
                          break;
                      }

                      if (controller.processIndex ==
                          controller.processes.length) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FinishView(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
