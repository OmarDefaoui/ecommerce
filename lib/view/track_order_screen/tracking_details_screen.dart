import 'package:ecommerce/widgets/status_stepper.dart';
import 'package:flutter/material.dart';

class TrackingDetailsScreen extends StatefulWidget {
  static String routeName = "/trackingDetails";
  const TrackingDetailsScreen({Key? key}) : super(key: key);

  @override
  _TrackingDetailsScreenState createState() => _TrackingDetailsScreenState();
}

class _TrackingDetailsScreenState extends State<TrackingDetailsScreen> {
  int processIndex = 2;
  final List<String> stepTitle = [
    'Order Signed',
    'Order Processed',
    'Shipped',
    'Out for delivery',
    'Delivered',
  ];
  final List<String> stepSubTitle = [
    'Lagos State, Nigeria',
    'Lagos State, Nigeria',
    'Lagos State, Nigeria',
    'Edo State, Nigeria',
    'Edo State, Nigeria',
  ];
  final List<String> stepDescription = [
    '20/18\n11:00 AM',
    '20/18\n11:00 AM',
    '21/18\n11:00 AM',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    final ProductTrackingDetailsArguments agrs = ModalRoute.of(context)!
        .settings
        .arguments as ProductTrackingDetailsArguments;
    final String trackingId = agrs.trackingId;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          trackingId,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        width: 400,
        height: double.maxFinite,
        child: StatusStepper(
          processIndex: processIndex,
          stepTitle: stepTitle,
          stepSubTitle: stepSubTitle,
          stepDescription: stepDescription,
          direction: Axis.vertical,
        ),
      ),
    );
  }
}

class ProductTrackingDetailsArguments {
  final String trackingId;

  ProductTrackingDetailsArguments({required this.trackingId});
}
