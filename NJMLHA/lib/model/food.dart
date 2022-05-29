class Food{
 String imgurl;
 String desc;
 String name;
 String waitTime;
  num score;
 String cal;
 num price;
 num quantity;
List<Map<String, String >> ingredinets;
String about;
bool hightLight;

Food(
this.imgurl,
this.desc,
this.name,
this.waitTime,
this.score,
this.cal,
this.price,
this.quantity,
this.ingredinets,
this.about,
{this.hightLight=false});

static List<Food> generateRecommendFoods () {
  return [
    Food (
        'assets/images/ca2ee.png',
        'No1. in Sales',
        'ُCheescake',
        '8 min',
        4.8,
        '325 kcal',
        23,
        1,
      [ 
        {
   'Noodle': 'assets/images/ca1.jpg',
},
{
   'Shrimp': 'assets/įmages/ingre2.png',
},
{
   'Egg': 'assets/images/ingre3.png',
},
{
   'Scallion': 'assets/images/ingre4.png',
},
      ],
      'Cheesecake rich in cream cheese, with a light and crisp texture with just the right amount of biscuits in the bottom layer, a wonderful and irresistible combination, try it now!',
hightLight: true),
Food (
        'assets/images/ca1.jpg',
        'No2. in Sales',
        'Carrot Cake',
        '50 min',
        4.8,
        '325 kcal',
        32,
        1,
      [ 
        {
   'Noodle': 'assets/images/ingre1.png',
},
{
   'Shrimp': 'assets/įmages/ingre2.png',
},
{
   'Egg': 'assets/images/ingre3.png',
},
{
   'Scallion': 'assets/images/ingre4.png',
},
      ],
      'Simply put, ramen is a Japanese noodle soup, with',
hightLight: true),
Food (
        'assets/images/cof1.jpg',
        'No3. in Sales',
        'Latta',
        '50 min',
        4.8,
        '325 kcal',
        20,
        1,
      [ 
        {
   'Noodle': 'assets/images/ingre1.png',
},
{
   'Shrimp': 'assets/įmages/ingre2.png',
},
{
   'Egg': 'assets/images/ingre3.png',
},
{
   'Scallion': 'assets/images/ingre4.png',
},
      ],
      'Simply put, ramen is a Japanese noodle soup, with',
hightLight: true),
Food (
        'assets/images/cof3.jpg',
        'No3. in Sales',
        'ُBlack Coffee',
        '50 min',
        4.8,
        '325 kcal',
        10,
        1,
      [ 
        {
   'Noodle': 'assets/images/ca1.jpg',
},
{
   'Shrimp': 'assets/įmages/ingre2.png',
},
{
   'Egg': 'assets/images/ingre3.png',
},
{
   'Scallion': 'assets/images/ingre4.png',
},
      ],
      'Simply put, ramen is a Japanese noodle soup, with',
hightLight: true),


];}


static List<Food> generatePopularFoods () {
  return [
    Food (
        'assets/images/ca2.jpg',
        'No.4',
        'Grand Chicken',
        '50 min',
        4.8,
        '325 kcal',
        34,
        1,
      [ 
        {
   'Noodle': 'assets/images/ingre1.png',
},
{
   'Shrimp': 'assets/įmages/ingre2.png',
},
{
   'Egg': 'assets/images/ingre3.png',
},
{
   'Scallion': 'assets/images/ingre4.png',
},
      ],
      'Simply put, ramen is a Japanese noodle soup, with',
hightLight: true),
Food(
'assets/images/ca1.jpg',
'No.6',
'Grand Chicken Delox',
'50 min',
4.8,
'325 kcal',
37,
0,
[
 {
   'Noodle': 'assets/images/ingre1.png',
},
{
   'Shrimp': 'assets/įmages/ingre2.png',
},
{
   'Egg': 'assets/images/ingre3.png',
},
{
   'Scallion': 'assets/images/ingre4.png',
},
      ],

'Simply put, ramen is a Japanese noodle soup',)];}
}