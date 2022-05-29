import 'package:NJMLHA/screens/customerLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOut extends StatefulWidget {
  @override
  _SignOut createState() => _SignOut();
}

class _SignOut extends State<SignOut> {
  FirebaseAuth auth = FirebaseAuth.instance;

  /*signOut() async {
    await FirebaseAuth.instance.signOut();
  }*/
  Future signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => customerLogin()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(child: RaisedButton(
          onPressed: () {
            signOut();
          },
        )),
      ),
    );
  }
}