import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
            child: Column(
              children: [
                // Home header
                Row(
                  children: [
                    //search text input
                    Expanded(
                      child: Container(
                        // width: SizeConfig.screenWidth * 0.6,
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search Product',
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 14),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    //cart icon
                    IconButtonWithCounter(
                      iconPath: 'assets/icons/Bell.svg',
                      counterValue: 0,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    //notifications icon
                    IconButtonWithCounter(
                      iconPath: 'assets/icons/Bell.svg',
                      counterValue: 2,
                      onPressed: () {},
                    ),
                  ],
                ),

                // Discount banner
                Container(
                  width: double.maxFinite,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    color: kColorPurple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: 'A summer Surprise\n'),
                        TextSpan(
                          text: 'Cashback 20%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Categories
                Row(
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
                ),

                // Special offers
                Column(
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
                ),
                const SizedBox(height: 6),

                // Popular products
                Column(
                  children: [
                    SectionTitle(
                      title: 'Popular Product',
                      onPressed: () {},
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          products.length,
                          (index) => PopularProductCard(
                            product: products[index],
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}

class PopularProductCard extends StatelessWidget {
  final ProductModel product;
  final void Function()? onTap;
  const PopularProductCard({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: product.id.toString(),
                  child: Image.asset(product.images[0]),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${product.title}\n',
              style: const TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: product.isFavourite
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: product.isFavourite ? kColorRed : kColorGrey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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

class SectionTitle extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const SectionTitle({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              'See More',
              style: TextStyle(
                color: kColorGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
