import 'package:e_commerce/screens/home/components/categories.dart';
import 'package:e_commerce/screens/home/components/discount_banner.dart';
import 'package:e_commerce/screens/home/components/home_header.dart';
import 'package:e_commerce/screens/home/components/popular_products.dart';
import 'package:e_commerce/screens/home/components/special_offers.dart';
import 'package:e_commerce/utils/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(30)),
              DiscountBanner(),
              SizedBox(height: getProportionateScreenWidth(30)),
              Categories(),
              SizedBox(height: getProportionateScreenWidth(30)),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(30)),
              PopularProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
