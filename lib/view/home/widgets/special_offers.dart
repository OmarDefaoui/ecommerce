import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/view/home/widgets/section_title.dart';
import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> specialOffers = [
      {
        "imagePath": "assets/images/Image Banner 2.png",
        "category": "Smartphone",
        "bandsCount": 18
      },
      {
        "imagePath": "assets/images/Image Banner 3.png",
        "category": "Fashion",
        "bandsCount": 24
      },
      {
        "imagePath": "assets/images/Image Banner 2.png",
        "category": "Smartphone",
        "bandsCount": 9
      },
      {
        "imagePath": "assets/images/Image Banner 3.png",
        "category": "Fashion",
        "bandsCount": 6
      },
    ];

    return Column(
      children: [
        SectionTitle(
          title: 'Special for You',
          onPressed: () {},
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              specialOffers.length,
              (index) => SpecialOfferCard(
                imagePath: specialOffers[index]['imagePath'],
                category: specialOffers[index]['category'],
                bandsCount: specialOffers[index]['bandsCount'],
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  final String imagePath, category;
  final int bandsCount;
  final void Function()? onTap;
  const SpecialOfferCard({
    Key? key,
    required this.imagePath,
    required this.category,
    required this.bandsCount,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 100,
      margin: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(14),
                width: 240,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF343434).withOpacity(0.4),
                      const Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "$category\n",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: "$bandsCount Brands")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}