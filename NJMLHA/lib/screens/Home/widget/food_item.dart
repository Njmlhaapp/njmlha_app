import 'package:NJMLHA/model/food.dart';
import 'package:flutter/material.dart';


class FoodItem extends StatelessWidget {
  final Food food;
  
   FoodItem(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),


      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 110,
            height: 110,
            child: Image.asset(food.imgurl, fit: BoxFit.fitHeight,),

          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(food.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Color.fromARGB(255, 119, 85, 73),
                      ),),
                      Icon(Icons.arrow_forward_ios_outlined,
                      color: Color.fromARGB(255, 81, 54, 45),
                      size: 15,), 
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(food.desc,
                  style: TextStyle(
                    color: food.hightLight ? Color.fromARGB(255, 79, 120, 81) : Colors.grey.withOpacity(0.8),
                    height: 1.5,
                  ),),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      
                       Text('${food.price}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                      ),
                       ),
                       Text('\ SAR',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,

                      ),
                      ),
                    ],
                  )
                ],
              ),

            ))
        ],
      ),
     
    );
  }
}