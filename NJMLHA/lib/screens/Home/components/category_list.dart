import 'package:flutter/material.dart';

import 'category_item.dart';


class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "All",
            press: (){}, 
            isActive: true,
            ),
            CategoryItem(
            title: "Nearest",
             press: (){}, 
            isActive: false,
            ),
            CategoryItem(
            title: "Popular",
            press: (){}, 
            isActive: false, 
            ),
        ],),
    );
  }
}

