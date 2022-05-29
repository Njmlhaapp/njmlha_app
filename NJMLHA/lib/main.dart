import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/customerLogin.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
} // void main

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  } // Widget build
} // class MyApp

class SplashScreen extends StatefulWidget {
  @override
 _SplashScreenState createState() => _SplashScreenState();
} // class SplashScreen

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
         builder: (BuildContext context) =>  customerLogin()))
    );
  } // void initState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Image.asset('assets/images/Logo.png'),
      ),
    );
  } // Widget build
} // class _SplashScreenState
