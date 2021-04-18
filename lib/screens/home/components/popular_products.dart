import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/screens/home/components/section_tittle.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTittle(
          text: 'Popular Products',
          press: () {},
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (i) => ProductCard(
                  product: demoProducts[i],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
