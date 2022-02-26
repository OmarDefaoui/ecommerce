// ignore_for_file: avoid_print

import 'package:ecommerce/services/checkout_service.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final CheckoutService checkoutService;
  CheckoutController({required this.checkoutService});

  void initt() {
    processIndex = 0;
    pages = CheckoutPages.deliveryTime;
    delivery = CheckoutDelivery.standardDelivery;
    formKey = GlobalKey<FormState>();
  }

  Color inProgressColor = Colors.black87;
  Color todoColor = const Color(0xffd1d2d7);

  final List<String> processes = [
    'Delivery',
    'Address',
    'Summary',
  ];

  late int _processIndex;
  int get processIndex => _processIndex;
  set processIndex(int value) {
    processIndex = value;
    try {
      update();
    } catch (e) {}
  }

  late CheckoutPages pages;

  late CheckoutDelivery _delivery;
  CheckoutDelivery get delivery => _delivery;
  set delivery(CheckoutDelivery value) {
    delivery = value;
    update();
  }

  late GlobalKey<FormState> formKey;
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;

  Color getColor(int index) {
    if (index == processIndex) {
      return inProgressColor;
    } else if (index < processIndex) {
      return kPrimaryColor;
    } else {
      return todoColor;
    }
  }
}
