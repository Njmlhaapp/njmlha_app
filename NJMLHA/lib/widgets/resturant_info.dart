import 'package:NJMLHA/model/resturant.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ResturantInfo extends StatelessWidget {
final resturant = Resturant.generateResturant();
  @override
  Widget build(BuildContext context) {
    var restaurant;
    return Container(
      margin:EdgeInsets.only(top:40),
      padding:EdgeInsets.symmetric(horizontal:25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                 Text(resturant.name,
                 style: TextStyle(
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
                   color: Color.fromARGB(255, 71, 117, 110),
                 ),),
                 SizedBox(height:10),
                 Row(children: [
                   Container(
                     padding: EdgeInsets.all(5),
                     decoration: BoxDecoration(
                       color: Colors.grey.withOpacity(0.4),
                       borderRadius:BorderRadius.circular(5),
                     ),
                     child: Text(resturant.waitTime,
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Color.fromARGB(255, 109, 99, 72)),
                       )),
                       SizedBox(width: 10,),
                     Text(resturant.distance,
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                       color: Color.fromARGB(255, 44, 82, 73).withOpacity(0.4),
                     ),),
                     SizedBox(width: 10,),
                     Text(resturant.lable,
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                       color: Color.fromARGB(255, 77, 72, 72).withOpacity(0.4),
                     ),),

                 ],
                 ),

                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:Image.asset(resturant.logoUrl,width:80,),
              ),

            ],
          ),
          SizedBox(width: 10,),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('"${resturant.desc}"',
            style: TextStyle(fontSize: 16,
            color: Color.fromARGB(255, 61, 61, 61).withOpacity(0.4)),
            ),
            Row(
              children: [
                Icon(
                Icons.star_outlined,
                color: Color.fromARGB(255, 243, 217, 68)),
                Text('${resturant.score}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ), 
                SizedBox(width: 15,),
          ],
              
            ),
          ],)
        ],
      )

    );
  }
}