import 'package:NJMLHA/model/resturant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FoodList extends StatelessWidget {
final int selected;
final Function callback;
final Resturant resturant;
 FoodList(this.selected, this.resturant, this.callback);
  @override
  Widget build(BuildContext context) {
    final Category = resturant.menu.keys.toList();
    return Container(
      height: 100,
      padding:  EdgeInsets.symmetric(vertical: 30),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 25),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => callback (index),
          child:  Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selected == index ? Color.fromARGB(255, 189, 176, 171) : Color.fromARGB(255, 222, 221, 218),
            ),
            child: Text(
              Category[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        separatorBuilder: (_, index) => SizedBox(width: 20,),
        
        itemCount: Category.length,
    )
      );
    
  }
}