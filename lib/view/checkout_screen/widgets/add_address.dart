import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/login/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 30, 14, 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.check_circle_rounded,
                    color: kPrimaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Billing address is the same as delivery address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              CustomTextFormField(
                hintText: 'Street 1',
                onChanged: (value) {},
                keyboardType: TextInputType.streetAddress,
                icon: Icons.map_rounded,
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                hintText: 'Street 2',
                onChanged: (value) {},
                keyboardType: TextInputType.streetAddress,
                icon: Icons.home,
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                hintText: 'City',
                onChanged: (value) {},
                keyboardType: TextInputType.streetAddress,
                icon: Icons.location_city_rounded,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width / 2,
                    child: CustomTextFormField(
                      hintText: 'State',
                      onChanged: (value) {},
                      keyboardType: TextInputType.streetAddress,
                      icon: Icons.maps_home_work_rounded,
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2 - 40,
                    child: CustomTextFormField(
                      hintText: 'Country',
                      onChanged: (value) {},
                      keyboardType: TextInputType.streetAddress,
                      icon: Icons.map_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
