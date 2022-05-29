import 'package:flutter/material.dart';
import 'package:NJMLHA/widgets/seller_login_form.dart';
import 'package:NJMLHA/widgets/user_type_selector.dart';

class sellerLogin extends StatefulWidget {
  @override
  _sellerLoginState createState() => _sellerLoginState();
} // class sellerLoginDemo

class _sellerLoginState extends State<sellerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                 height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), 
                      ),
                    ], // boxShadow
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 40),
                    Image.asset('assets/images/Logo.png', height: 230),
                    userSelector(),
                  ], // children
                ),
              ],
            ),
            SellerLoginForm(),
            
          ],
        ),
      ),
    );
  } // Widget build
} // class _sellerLoginDemoState
