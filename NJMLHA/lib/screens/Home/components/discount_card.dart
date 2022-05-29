import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Offers & Discounts",
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 55, 55, 55),)),
          Container(
            margin: EdgeInsets.symmetric(vertical:20),
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/Moca.jpg"),
            ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 99, 94, 79).withOpacity(0.7),
                  Colors.grey.withOpacity(0.7),
                ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Image.asset("assets/images/coffeebean.png"),
                    ),
                    Expanded(
                      child: RichText(text: TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(text: "50% on first 5 orders",
                          style: TextStyle(fontSize: 16)),
                          TextSpan(text: "\n Link Cafe",
                          style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}