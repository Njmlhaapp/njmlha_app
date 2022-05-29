import 'package:NJMLHA/model/food.dart';

class Resturant {
String name;
String waitTime;
String distance;
String lable;
String logoUrl;
String desc;
num score;
Map<String, List<Food> > menu;

Resturant(
this.name,
this.waitTime,
this.distance,
this.lable,
this.logoUrl,
this.desc,
this.score,
this.menu,

);
  static Resturant generateResturant (){
 return Resturant (
    'Link Cafe',
    '5 - 7 min',
    '1.5km',
    '',
    'assets/images/Picture6.png',
    'Where The Tasty Food!',
    4.7,
    {
      'Recommend': Food.generateRecommendFoods (),
      'Sweets': Food.generatePopularFoods (),
      'Hot Drinks': [],
      'Cold Drinks': [],
    },
  );
    }  
    }