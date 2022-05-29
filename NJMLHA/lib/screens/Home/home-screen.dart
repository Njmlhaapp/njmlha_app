import 'package:flutter/material.dart';
import '../../components/bottom_nav_bar.dart';
import 'components/app_bar.dart';
import 'components/body.dart';


// للآن لم يتم ربط الصفحة
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppbar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}