import 'package:NJMLHA/widgets/seller_add_product_form.dart';
import 'package:flutter/material.dart';

class SellerAddProduct extends StatefulWidget {
  @override
  _SellerAddProductState createState() => _SellerAddProductState();
} // class SellerAddProduct

class _SellerAddProductState extends State<SellerAddProduct> {
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
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SellerAddProductForm(),
          ]
        )
      ),

    );
  } // Widget build
} // class _SellerAddProductState