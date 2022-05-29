import 'package:NJMLHA/screens/Home/home_customer.dart';
import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  final String shopName, svgSrc;
  final Function press;
  const ItemCard({
    Key? key, 
    required this.shopName, 
    required this.svgSrc, 
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
         BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.grey,
            
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: 
          (){
             Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeResturant()
                  )
                );
          }, 
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding:  EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 67, 111, 68).withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(svgSrc,
                  width: size.width * 0.18,),
                ),
                SizedBox(height: 5,),
                Text(shopName, style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 