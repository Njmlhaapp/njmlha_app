import 'package:NJMLHA/screens/CustomerProfile/C_profile_screen.dart';
import 'package:flutter/material.dart';

import '../screens/Home/home-screen.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [BoxShadow(offset: Offset(0, -7),
        blurRadius: 33,
        color: Color.fromARGB(255, 81, 79, 79).withOpacity(0.11),
        ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(

          icon:  Icon(Icons.home_outlined ), 
          onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen()
                )
              ); } ),
              IconButton(

          icon:  Icon(Icons.shopping_bag_outlined), 
          onPressed: (){ /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen() هنا رح اجط صفحة الاوردرز
                )
              ); */ } ),
              IconButton(

          icon:  Icon(Icons.person_outlined), 
          onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CProfileScreen() 
                )
              ); } ),
        ],
      ),
     );
  }
}


  