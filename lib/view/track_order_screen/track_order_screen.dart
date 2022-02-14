import 'package:ecommerce/view/track_order_screen/tracking_details_screen.dart';
import 'package:flutter/material.dart';

class TrackOrderScren extends StatefulWidget {
  static String routeName = "/trackOrder";
  const TrackOrderScren({Key? key}) : super(key: key);

  @override
  _TrackOrderScrenState createState() => _TrackOrderScrenState();
}

class _TrackOrderScrenState extends State<TrackOrderScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track Order',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  TrackingDetailsScreen.routeName,
                  arguments: ProductTrackingDetailsArguments(
                    trackingId: 'OD - 424923192 - N',
                  ),
                );
              },
              child: const Text('tracking details'),
            ),
          ],
        ),
      ),
    );
  }
}
