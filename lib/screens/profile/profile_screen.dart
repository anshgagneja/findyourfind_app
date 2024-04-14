import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders/order_screen.dart';
import 'package:shop_app/screens/splash/components/splash_content.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import '../../helper/pref.dart';
import '../sign_in/sign_in_screen.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfileMenu(
              text: "Orders",
              icon: "assets/icons/Bill Icon.svg",
              press: () {
                Navigator.pushNamed(context, OrderScreen.routeName);

              },
            ),
            // ProfileMenu(
            //   text: "Help Center",
            //   icon: "assets/icons/Question mark.svg",
            //   press: () {},
            // ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                Pref.setValue(Pref.user_id, -1);
                Navigator.pushReplacementNamed(context, SignInScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
