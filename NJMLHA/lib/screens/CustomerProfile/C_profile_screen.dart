import 'package:NJMLHA/components/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:NJMLHA/components/coustom_bottom_nav_bar.dart';
import 'package:NJMLHA/enums.dart';
import 'components/body.dart';

class CProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Center(child: Text("Profile")),
        backgroundColor: Color.fromARGB(255, 158, 149, 133),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
