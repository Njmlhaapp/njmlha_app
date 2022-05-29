import 'package:NJMLHA/screens/Home/home-screen.dart';
import 'package:NJMLHA/screens/location_main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'original_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerLoginForm extends StatefulWidget {
  @override
  _CustomerLoginFormState createState() => _CustomerLoginFormState();
} // CustomerLoginForm

class _CustomerLoginFormState extends State<CustomerLoginForm> {
  bool _passwordVisible = true;
  @override
  void initState() {
    _passwordVisible = !_passwordVisible;
  } // initState

  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  
  // string for displaying the error Message
  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  } // void dispose

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            TextFormField(
              controller: emailController,
              onChanged: (value) => _email = value,
              validator: (value) => value!.isEmpty ? 'You Must Enter Email address' : null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                prefixIcon: Icon(Icons.email_outlined),
                hintText: '|    Email address',
              ),
            ),

            SizedBox(height: 30),
            TextFormField(
              controller: passwordController,
              onChanged: (value) => _password = value,
              validator: (value) => value!.isEmpty ? 'You Must Enter Password' : null,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                prefixIcon: Icon(Icons.lock_outline),
                hintText: '|    Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    }); // setState
                  }, // onPressed
                ),
              ),
            ),
            
            SizedBox(height: 100),
            OriginalButton(
              text: 'Log in',
              onPressed: () {
                 signIn(emailController.text, passwordController.text);
              }, // onPressed
              textColor: Colors.black,
              bgColor: Colors.brown.shade200,
            ),
          ],
        ),
      ),
    );
  } // Widget build

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
          .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
          .then((uid) => {
            Fluttertoast.showToast(msg: "Login Successful"),
            Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LocationMain())),
          }); // .then
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        } // switch
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      } // on FirebaseAuthException
    } // if
  } // void signIn
} // _CustomerLoginFormState

