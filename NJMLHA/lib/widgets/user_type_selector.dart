import 'package:flutter/material.dart';
import 'package:NJMLHA/screens/customerLogin.dart';
import 'package:NJMLHA/screens/sellerLogin.dart';

class userSelector extends StatefulWidget {
  @override
  _userSelectorState createState() => _userSelectorState();
} // class userSelector

class _userSelectorState extends State<userSelector> {
  int selectedIndex = 1;
  List<String> categories = ['Customer', 'Seller'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            // ------------------- هناا مفروض اعدل عشان يتحدد اسم المستخدم الي اضفط عليه
            onTap: () {
              setState(() {
                selectedIndex = index;
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => customerLogin())); // Navigator
                } // if
                if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sellerLogin())); // Navigator
                } // if
              }); // setState
            }, // onTap
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: index == selectedIndex ? Colors.black : Colors.black54,
                  fontSize: 24,
                  fontWeight: index == selectedIndex
                      ? FontWeight.bold
                      : FontWeight.normal,
                  letterSpacing: 2,
                  decoration: index == selectedIndex
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
          );
        }, // itemBuilder
      ),
    );
  } // Widget build
} // class _userSelectorState