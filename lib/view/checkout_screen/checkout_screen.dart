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

class CheckoutScreen extends StatefulWidget {
  static String routeName = "/checkout";
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _processIndex = 0;
  CheckoutPages pages = CheckoutPages.deliveryTime;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return kPrimaryColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 160,
            width: double.maxFinite,
            child: StatusChange.tileBuilder(
              theme: StatusChangeThemeData(
                direction: Axis.horizontal,
                connectorTheme:
                    const ConnectorThemeData(space: 1.0, thickness: 1.0),
              ),
              builder: StatusChangeTileBuilder.connected(
                itemWidth: (_) =>
                    MediaQuery.of(context).size.width / _processes.length,
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
                      _processes[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getColor(index),
                      ),
                    ),
                  );
                },
                indicatorWidgetBuilder: (_, index) {
                  if (index <= _processIndex) {
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
                    return const OutlinedDotIndicator(
                      size: 30,
                      borderWidth: 1.0,
                      color: todoColor,
                    );
                  }
                },
                lineWidgetBuilder: (index) {
                  if (index > 0) {
                    if (index == _processIndex) {
                      final prevColor = getColor(index - 1);
                      final color = getColor(index);
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
                        color: getColor(index),
                      );
                    }
                  } else {
                    return null;
                  }
                },
                itemCount: _processes.length,
              ),
            ),
          ),
          pages == CheckoutPages.deliveryTime
              ? const DeliveryTime()
              : pages == CheckoutPages.addAddress
                  ? const AddAddress()
                  : const Summary(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _processIndex > 0,
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
                      setState(() {
                        _processIndex--;

                        switch (_processIndex) {
                          case 0:
                            pages = CheckoutPages.deliveryTime;
                            break;
                          case 1:
                            pages = CheckoutPages.addAddress;
                            break;
                          case 2:
                            pages = CheckoutPages.summary;
                            break;
                        }
                      });
                    },
                  ),
                ),
                CustomButton(
                  text: _processIndex == _processes.length ? 'Confirm' : 'Next',
                  widthMultiplyPer: 0.4,
                  onPressed: () {
                    setState(() {
                      _processIndex++;

                      switch (_processIndex) {
                        case 0:
                          pages = CheckoutPages.deliveryTime;
                          break;
                        case 1:
                          pages = CheckoutPages.addAddress;
                          break;
                        case 2:
                          pages = CheckoutPages.summary;
                          break;
                      }

                      if (_processIndex == _processes.length) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FinishView(),
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summary',
];
