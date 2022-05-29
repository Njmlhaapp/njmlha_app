import 'package:NJMLHA/model/food.dart';
import 'package:NJMLHA/screens/Details/widget/food_details.dart';
import 'package:NJMLHA/screens/Details/widget/food_img.dart';
import 'package:NJMLHA/screens/Home/home_customer.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Food food;
  DetailsPage(this.food);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 197, 181),
      body: SingleChildScrollView(
        child: Column( children: [
      AppBar(
      backgroundColor: Color.fromARGB(255, 180, 197, 181),
      elevation: 0,
      leading: IconButton(icon: Icon(Icons.arrow_back),
    
     onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeResturant()
                )
              ); // Navigator
            },
            color: Colors.brown.shade400,  ),
    ),
    FoodImg(food),
    FoodDetails(food),
        ],),
        ),
        floatingActionButton: Container(
          width: 100,
          height: 70,
          child: RawMaterialButton(
            fillColor: Color.fromARGB(255, 99, 131, 99),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 30,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle, 
              ),
              child: Text(food.quantity.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
            ),
            ],
            ),
            onPressed: (){},
          ),
        ),
        );
  }
}