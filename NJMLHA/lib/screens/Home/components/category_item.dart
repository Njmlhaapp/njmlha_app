import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isActive ;
  final Function press;
   CategoryItem({
    Key? key, required this.title, required this.isActive,required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            Text(
              title, 
              style: isActive
              ? TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.bold,
                ) : TextStyle(fontSize: 12)
                ),
                if (isActive) 
                Container(
                  margin:EdgeInsets.symmetric(vertical:5),
                  height: 3,
                  width: 22,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 19, 77, 59),
                    borderRadius:BorderRadius.circular(10),
                  ),
    
                ),
                ],
        ),
      ),
    );
  }
}
