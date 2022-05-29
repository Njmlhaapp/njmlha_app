import 'dart:ui';

import 'package:NJMLHA/screens/seller_add_product.dart';
import 'package:flutter/material.dart';

class SellerMenu extends StatefulWidget {
  @override
  _SellerMenuState createState() => _SellerMenuState();
} // class SellerMenu

class _SellerMenuState extends State<SellerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, // onPressed
          icon: Icon(
            Icons.arrow_back,
            color: Colors.brown.shade200,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SellerAddProduct()
                  )
                ); }, // onPressed
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.brown.shade200,
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/MenuIcon.png', height: 200, width: 160),
            SizedBox(height: 10,),
            Text(
              'You havent added any product to your store yet,, Click on add-on icon at the top', 
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              
            )
          ]
        ),
      ),

    );
  } // Widget build
} // class _SellerMenuState