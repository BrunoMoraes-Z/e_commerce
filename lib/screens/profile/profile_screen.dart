import 'package:e_commerce/components/custom_bottom_nav_bar.dart';
import 'package:e_commerce/screens/profile/components/body.dart';
import 'package:e_commerce/utils/enums.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(
              flex: 2,
            ),
            Text('Profile'),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
