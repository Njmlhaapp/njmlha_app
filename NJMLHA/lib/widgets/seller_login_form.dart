import 'package:NJMLHA/forget_password.dart';
import 'package:NJMLHA/widgets/seller_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:NJMLHA/widgets/original_button.dart';
import 'package:NJMLHA/screens/sellerSignup.dart';
import 'package:NJMLHA/screens/seller_home.dart';

class SellerLoginForm extends StatefulWidget {
  const SellerLoginForm({Key? key}) : super(key: key);
  @override
  _SellerLoginFormState createState() => _SellerLoginFormState();
} // SellerLoginForm

class _SellerLoginFormState extends State<SellerLoginForm> {
  bool _passwordVisible = true;
  @override
  void initState() {
    _passwordVisible = !_passwordVisible;
  } // initState

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  
  // string for displaying the error Message
  String? errorMessage;

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
              autofocus: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please Enter Your Email");
                } // if
                // reg expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                .hasMatch(value)) {
                  return ("Please Enter a valid email");
                } // .hasMatch
                return null;
              }, // validator
              onSaved: (value) {
                emailController.text = value!;
              }, // onSaved
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                prefixIcon: Icon(Icons.email_outlined),
                hintText: '|    Email address',
              ),
            ),

            SizedBox(height: 30),
            TextFormField(
              obscureText: !_passwordVisible,
              autofocus: false,
              controller: passwordController,
              validator: (value) {
                RegExp regex = new RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Password is required for login");
                } // if
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid Password(Min. 6 Character)");
                } // if
              }, // validator
              onSaved: (value) {
                passwordController.text = value!;
              }, // onSaved
              textInputAction: TextInputAction.done,
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

            SizedBox(height: 5),
            FlatButton(
              onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPassword()
                    )
                  );},
              child: Text('Forgot Password?'),
            ),

            SizedBox(height: 50),
            OriginalButton(
              text: 'Log in',
              onPressed: () {
                signIn(emailController.text, passwordController.text);
              }, // onPressed
              textColor: Colors.black,
              bgColor: Colors.brown.shade200,
            ),
            
            SizedBox(height: 5),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sellerSignup()
                  )
                ); // Navigator
              }, // onPressed
              child: Text('New Seller? Sign up'),
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
            MaterialPageRoute(builder: (context) => SellerNavigationBar(1))),
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
} // _LoginFormState
