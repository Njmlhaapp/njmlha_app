import 'package:NJMLHA/model/resturant.dart';
import 'package:NJMLHA/screens/Home/widget/food_list.dart';
import 'package:NJMLHA/screens/Home/widget/food_list_view.dart';
import 'package:NJMLHA/screens/customer_cart.dart';
import 'package:NJMLHA/widgets/resturant_info.dart';
import 'package:flutter/material.dart';
import 'package:NJMLHA/widgets/resturant_bar.dart';
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class HomeResturant extends StatefulWidget {

  @override
  State<HomeResturant> createState() => _HomeResturantState();
}

class _HomeResturantState extends State<HomeResturant> {
  var selected = 0;
  final pageController = PageController();
  final resturant = Resturant.generateResturant();

  @override
  Widget build(BuildContext context) {
    Colors.grey.shade200; 
    return Scaffold(
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:  [
         ResturantBar(
           Icons.arrow_back_ios_outlined,
         ),
         ResturantInfo(),
         FoodList(selected, resturant, 

         (int index){
           setState(() {
             selected = index;
           });
           pageController.jumpToPage(index);
         }),
         Expanded(child: FoodListView(
           selected, (int index) {
             setState(() {
               selected = index;
             });
           },
           pageController,
           resturant,
         ),),
         Container(
           padding: EdgeInsets.symmetric(horizontal: 25),
           height: 60,
           child: SmoothPageIndicator(
             controller: pageController,
             count: resturant.menu.length,
             effect: CustomizableEffect(
               dotDecoration: DotDecoration(
                 width: 8,
                 height: 8,
                 color: Colors.grey.withOpacity(0.5),
                 borderRadius: BorderRadius.circular(8),

               ),
               activeDotDecoration: DotDecoration(
                 width: 10,
                 height: 10,
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 dotBorder: DotBorder(
                   color: Colors.brown,
                   padding: 2,
                   width: 2,
                 )

               ),
               
             ),
             onDotClicked: (index) => pageController.jumpToPage(index),
           ),
         )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerCart()
                    )
                  );}, //سلة المشتريات
        backgroundColor: Color.fromARGB(255, 130, 164, 131),
        elevation: 2,
        child: Icon(Icons.shopping_bag_outlined,
        color: Color.fromARGB(255, 62, 61, 61),
        size: 30,
        ),
      )

    );
    

  }
}

                                                    