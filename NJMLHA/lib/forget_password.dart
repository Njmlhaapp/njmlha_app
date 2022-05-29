import 'package:flutter/material.dart';
import 'package:NJMLHA/screens/sellerLogin.dart';
import 'package:NJMLHA/otp.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
    appBar: AppBar(
     backgroundColor: Colors.grey.shade200,
      automaticallyImplyLeading: true,
     
      // ignore: prefer_const_constructors
      leading: IconButton(icon: Icon(Icons.arrow_back),
      
       onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => sellerLogin()
                  )
                ); // Navigator
              },
              color: Colors.black, 
      )
      ),
    
      body: Column(
        
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: ListView(
                  children: [
                    
const Text(
  'Forget Password?',
  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black, height: 5),
),
const Text(
  'Enter your email please',
   style: TextStyle(color: Colors.grey, fontSize: 20.0 ),
),                    
                    
                  
                    
                    
                    Container(
    
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Email: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 9.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

                    SizedBox(
                      width: 300,
                     
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => otp()
                  )
                );
                        },
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.brown.shade200),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        
                        child: Padding(
                          
                        padding: EdgeInsets.all(14.0),
                          
                          child: Text(
                            'Send otp code',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        
                      ),
                      
                    ),
     SizedBox(
       height: 250,
     )
      ],

    )
    );
  }
}
