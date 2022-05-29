import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
} // class PrivacyPolicy

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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

      body: Center(
        child: Text(
          'Privacy and Policy for Application, Here', 
          textAlign: TextAlign.center,
        ),
      ),

    );
  } // Widget build
} // class _PrivacyPolicyState