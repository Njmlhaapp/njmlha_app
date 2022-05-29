import 'package:NJMLHA/screens/Analysis.dart';
import 'package:NJMLHA/screens/CustomerProfile/C_profile_screen.dart';
import 'package:NJMLHA/screens/SellerProfile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:NJMLHA/screens/seller_menu.dart';
import 'package:NJMLHA/screens/seller_home.dart';
import 'package:NJMLHA/screens/privacy_policy.dart';
import 'package:NJMLHA/screens/sellerLogin.dart';


class SellerNavigationBar extends StatefulWidget {
  int currentIndex;
  SellerNavigationBar(this.currentIndex);

  @override
  _SellerNavigationBarState createState() => _SellerNavigationBarState();
}

class _SellerNavigationBarState extends State<SellerNavigationBar> {
  // int _currentIndex = 0;

  final List<Widget> _children = [
    SellerMenu(),
    SellerHome(),
    ProfileScreen(),
    analysis(),
  ];

  void onTapTapped(int index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      body: _children[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapTapped,
        currentIndex: widget.currentIndex,
        elevation: 4.0,
        selectedItemColor:  Colors.brown.shade200,
        unselectedItemColor: Color(0xFF808080),
        backgroundColor: Color(0xFFFFFFFF),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Seller Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Seller Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Seller Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Store Analytic',
          ),
        ],
      ),
    );
  }
}