import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:NJMLHA/model/seller_user_model.dart';
import 'package:NJMLHA/widgets/original_button.dart';
import 'package:NJMLHA/screens/sellerLogin.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);
  @override
  _SignupFormState createState() => _SignupFormState();
} // class SignupForm

class _SignupFormState extends State<SignupForm> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  } // void initState

  final _auth = FirebaseAuth.instance;

  String? errorMessage; // string for displaying the error Message

  // our form key
  final _formKey = GlobalKey<FormState>();

  final storeNameEditingController = new TextEditingController();
  final phoneNumberEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final cummericalRecordNumberEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                TextFormField(  // Store Name field
                  autofocus: false,
                  controller: storeNameEditingController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{3,}$');
                    if (value!.isEmpty) {
                      return ("Store Name cannot be Empty");
                    } // if
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid name(Min. 3 Character)");
                    } // if
                    return null;
                  }, // validator
                  onSaved: (value) {
                    storeNameEditingController.text = value!;
                  }, // onSaved
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    prefixIcon: Icon(Icons.person_outlined),
                    hintText: '|    Store Name',
                  ),
                ),
                
                SizedBox(height: 30),
                TextFormField( // Phone Number field
                  autofocus: false,
                  controller: phoneNumberEditingController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Phone Number cannot be Empty");
                    } // if
                    return null;
                  }, // validator
                  onSaved: (value) {
                    phoneNumberEditingController.text = value!;
                  }, // onSaved
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    prefixIcon: Icon(Icons.phone_outlined),
                    hintText: '|    Phone Number',
                  ),
                ),

                SizedBox(height: 30),
                TextFormField(
                  autofocus: false,
                  controller: emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Your Email");
                    } // if
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                      return ("Please Enter a valid email");
                    } // if
                    return null;
                  }, // validator
                  onSaved: (value) {
                    emailEditingController.text = value!;
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
                  autofocus: false,
                  controller: cummericalRecordNumberEditingController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Cummerical Record Number cannot be Empty");
                    } // if
                    return null;
                  }, // validator
                  onSaved: (value) {
                    cummericalRecordNumberEditingController.text = value!;
                  }, // onSaved
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F5),
                    prefixIcon: Icon(Icons.folder_outlined),
                    hintText: '|    Cummerical record number',
                  ),
                ),

                SizedBox(height: 30),
                TextFormField(
                  autofocus: false,
                  controller: passwordEditingController,
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
                    passwordEditingController.text = value!;
                  }, // onSaved
                  textInputAction: TextInputAction.next,
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
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 50),
        OriginalButton(
          text: 'Sign up',
          textColor: Colors.black,
          bgColor: Colors.brown.shade200,
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          }, // onPressed
        ),
        SizedBox(height: 5),
        FlatButton (
          onPressed: () {},
          child: Text('By signing up you agree with our Terms of Use'),
        ),
      ],
    );
  } // Widget build

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        }); // .catchError
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
      } // on FirebaseAuthException catch
    } // if
  } // void signUp

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? seller = _auth.currentUser;
    SellerUserModel sellerUserModel = SellerUserModel();

    // writing all the values
    sellerUserModel.email = seller!.email;
    sellerUserModel.uid = seller.uid;
    sellerUserModel.storeName = storeNameEditingController.text;
    sellerUserModel.phoneNumber = phoneNumberEditingController.text;
    sellerUserModel.cummericalRecordNumber = cummericalRecordNumberEditingController.text;

    await firebaseFirestore
        .collection("sellers")
        .doc(seller.uid)
        .set(sellerUserModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
      (context),
      MaterialPageRoute(builder: (context) => sellerLogin()),
      (route) => false
    ); // Navigator.pushAndRemoveUntil
  } // postDetailsToFirestore
} // class _SignupFormState
