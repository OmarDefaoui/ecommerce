import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/utils/server_constants.dart';
import 'package:ecommerce/view/products_screen/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  final List<CategoryModel> categoriesList;
  const Categories({
    Key? key,
    required this.categoriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            categoriesList.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ProductsScreen.routeName,
                    arguments: ProductsScreenArguments(
                      link: ServerConstants.CATEGORY_PRODUCTS_URI +
                          categoriesList[index].id.toString(),
                    ),
                  );
                },
                child: Container(
                  width: 62,
                  padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
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
                        child: SvgPicture.asset(categoriesList[index].image),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        categoriesList[index].title,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
