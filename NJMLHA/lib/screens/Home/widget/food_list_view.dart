import 'package:NJMLHA/model/resturant.dart';
import 'package:NJMLHA/screens/Details/details.dart';
import 'package:NJMLHA/screens/Home/widget/food_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FoodListView extends StatelessWidget {
final int selected;
final Function callback;
final PageController pageController;
final Resturant resturant;
FoodListView(this.selected, this.callback, this.pageController, this.resturant);

  @override
  Widget build(BuildContext context) {
    final Category = resturant.menu.keys.toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: Category.map((e) => 
         ListView.separated(
           padding: EdgeInsets.zero,
           itemBuilder: (context, index) => GestureDetector(
             onTap: (){ // هنا الانتقال لصفحة المنتج
             Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(resturant.menu[Category[selected]]![index],),
                )
              ); 

             },
             child: FoodItem(
               resturant.menu[Category[selected]]![index],
             ),
           ),
           separatorBuilder: (_, index) => SizedBox(height: 15), 
           itemCount: resturant.menu[Category[selected]]!.length)).toList(),
      ),
    );
  }
}