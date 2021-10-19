import 'package:flutter/material.dart';

class BackgroundScaffold extends StatelessWidget {
  final Widget child;
  final int type;
  final PreferredSizeWidget? appBar;
  const BackgroundScaffold({
    Key? key,
    required this.child,
    this.type = 1,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        height: size.height,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/${type == 3 ? 'signup_top' : 'main_top'}.png',
                width: size.width * 0.3,
              ),
            ),
            if (type == 1)
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/main_bottom.png',
                  width: size.width * 0.2,
                ),
              )
            else if (type == 2)
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/login_bottom.png',
                  width: size.width * 0.4,
                ),
              )
            else
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/login_bottom.png',
                  width: size.width * 0.4,
                ),
              ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
