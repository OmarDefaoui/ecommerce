import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        categories.length,
        (index) => SizedBox(
          width: 50,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kColorOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(categories[index]['icon']),
              ),
              const SizedBox(height: 4),
              Text(
                categories[index]['text'],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
