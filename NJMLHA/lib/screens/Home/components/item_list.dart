import 'package:flutter/material.dart';
import 'Item_card.dart';



class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[ 
        ItemCard(
          svgSrc: "assets/images/storelogo1.png",
          shopName: "Link Cafe",
          press: (){},
        ),
        ItemCard(
          svgSrc: "assets/images/Storelogo2.png",
          shopName: "Chocolava",
          press: (){},
        ),
        ItemCard(
          svgSrc: "assets/images/Storelogo3.png",
          shopName: "Beit Alsultan",
          press: (){},
        ),
      ],),
    );
  }
}
