import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class ExpandedText extends StatefulWidget {
  const ExpandedText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;
  bool needExpanding = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(200, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
      needExpanding = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Text(
            flag
                ? (firstHalf + (needExpanding ? "..." : ""))
                : (firstHalf + secondHalf),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
            child: Visibility(
              visible: needExpanding,
              child: Row(
                children: [
                  Text(
                    flag ? "See more" : "See less",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
