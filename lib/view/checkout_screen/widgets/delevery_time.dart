import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/enums.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  const DeliveryTime({Key? key}) : super(key: key);

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  @override
  Widget build(BuildContext context) {
    CheckoutDelivery delivery = CheckoutDelivery.standardDelivery;
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 50),
          RadioListTile<CheckoutDelivery>(
            value: CheckoutDelivery.standardDelivery,
            groupValue: delivery,
            onChanged: (CheckoutDelivery? value) {
              setState(() {
                delivery = value!;
              });
            },
            title: const Text(
              'Standard Delivery',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: const Text(
              'Order wil be delivered between 3 - 5 business days',
            ),
            activeColor: kPrimaryColor,
          ),
          const SizedBox(height: 40),
          RadioListTile<CheckoutDelivery>(
            value: CheckoutDelivery.nextDayDelivery,
            groupValue: delivery,
            onChanged: (CheckoutDelivery? value) {
              setState(() {
                delivery = value!;
              });
            },
            title: const Text(
              'Next Day Delivery',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: const Text(
              'Order wil be delivered the next day',
            ),
            activeColor: kPrimaryColor,
          ),
          const SizedBox(height: 40),
          RadioListTile<CheckoutDelivery>(
            value: CheckoutDelivery.nominatedDelivery,
            groupValue: delivery,
            onChanged: (CheckoutDelivery? value) {
              setState(() {
                delivery = value!;
              });
            },
            title: const Text(
              'Nominated Delivery',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: const Text(
              'Pick a particular date from the calendar and order will be delivered on selected date',
            ),
            activeColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
