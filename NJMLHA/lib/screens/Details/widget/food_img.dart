import 'package:NJMLHA/model/food.dart';
import 'package:flutter/material.dart';

class FoodImg extends StatelessWidget {
  final Food food;
  FoodImg(this.food);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: [
         Column(
           children: [ Expanded(
            flex: 1,
            child: Container(
              

            ),),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  
                ),
                
                color: Colors.grey.shade200,
                ),
              ),

            ),],
         ),
         Align(
           alignment: Alignment.center,
           child: Container(
             margin: EdgeInsets.all(30),
             width: 180,
             height: 180,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               boxShadow: [
                 BoxShadow(
                 color: Colors.grey.withOpacity(0.3),
                 offset:Offset(-1,10),
                 blurRadius:10,
             )],

             ),
             child: Image.asset(food.imgurl,fit: BoxFit.cover,),
           ),
         )

        ],
      ),
    );
  }
}