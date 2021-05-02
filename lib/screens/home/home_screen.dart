import 'package:e_commerce/components/custom_bottom_nav_bar.dart';
import 'package:e_commerce/screens/home/components/body.dart';
import 'package:e_commerce/utils/enums.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
