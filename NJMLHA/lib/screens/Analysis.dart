import 'dart:ui';
import 'package:flutter/material.dart';

class analysis extends StatefulWidget {
  @override
  _SellerMenuState createState() => _SellerMenuState();
} // class SellerMenu

class _SellerMenuState extends State<analysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Center(child: Text("Analysis")),
        backgroundColor: Color.fromARGB(255, 158, 149, 133),
        elevation: 1,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/analysis.png',
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            'Coming Soon!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          )
        ]),
      ),
    );
  } // Widget build
} // class _SellerMenuState