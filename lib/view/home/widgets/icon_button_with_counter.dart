import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonWithCounter extends StatelessWidget {
  final String iconPath;
  final int counterValue;
  final void Function()? onPressed;
  const IconButtonWithCounter({
    Key? key,
    required this.iconPath,
    required this.counterValue,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      icon: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(iconPath),
          ),
          Visibility(
            visible: counterValue != 0,
            child: Positioned(
              right: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: kColorRed,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    '$counterValue',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      height: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
