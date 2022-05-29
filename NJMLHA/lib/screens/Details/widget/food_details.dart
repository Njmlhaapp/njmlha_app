import 'package:NJMLHA/model/food.dart';
import 'package:NJMLHA/screens/Details/widget/food_quantity.dart';
import 'package:flutter/material.dart';

class FoodDetails extends StatelessWidget {
final Food food;
FoodDetails(this.food);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.5),
      color: Colors.grey.shade200,
      child:Column(
        children: [
          Text(food.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconText(
                Icons.access_time_outlined,
                Color.fromARGB(255, 46, 87, 71),
                food.waitTime,
              ),
              _buildIconText(
                Icons.star_outlined,
                Colors.yellow,
                food.score.toString(),
              ),
              _buildIconText(
                Icons.local_fire_department_outlined,
                Colors.red,
                food.cal,
              ),

            ],
          ),
          SizedBox(height: 30),
          FoodQuantity(food),
          SizedBox(height: 30),
          Row(
            children: [
              Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 68, 54, 49),
                )
              )
            ],
          ),
          SizedBox(height: 30),
          Text(food.about,
          style: TextStyle(
            wordSpacing: 1.8,
            height: 1.5,
            fontSize: 16,
            color: Color.fromARGB(255, 95, 84, 80),
          ),),
           SizedBox(height: 30),


        
        ],
        
      ),
    );
  }
  Widget _buildIconText (IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        Text(text,
        style: TextStyle(
          fontSize: 16,
        ),),
      ],
    );
  }
}