import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/utils/constants.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        categoriesList.length,
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
    );
  }
}
