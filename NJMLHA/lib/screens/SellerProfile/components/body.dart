import 'package:NJMLHA/screens/SignOut.dart';
import 'package:NJMLHA/screens/support.dart';
import 'package:flutter/material.dart';
import '../../customerLogin.dart';
import '../../customer_setting.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 25),
          ProfilePic(),
          SizedBox(height: 50),
          ProfileMenu(
            text: "Edit profile",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CustomerSetting(),
              ),
            ),
          ),
          ProfileMenu(
            text: "Support",
            icon: "assets/icons/Question mark.svg",
            press: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SupportScreen(),
              ),
            ),
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SignOut(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
