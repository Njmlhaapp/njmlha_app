import 'package:flutter/material.dart';
import 'package:NJMLHA/widgets/signup_form.dart';
import 'package:NJMLHA/widgets/original_button.dart';

class sellerSignup extends StatefulWidget {
  @override
  _sellerSignuoState createState() => _sellerSignuoState();
} // class sellerSignupDemo

class _sellerSignuoState extends State<sellerSignup> {
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
                  ], // children
                ),
              ],
            ),
            SignupForm(),
            SizedBox(height: 100),
            /*OriginalButton(
              text: 'Sign up',
              onPressed: () {},
              textColor: Colors.black,
              bgColor: Colors.brown.shade200,
            ),
            SizedBox(height: 5),
            FlatButton(
              onPressed: () {},
              child: Text('By signing up you agree with our Terms of Use'),
            ),*/
          ],
        ),
      ),
    );
  } // Widget build
} // class _sellerSignuoDemoState
