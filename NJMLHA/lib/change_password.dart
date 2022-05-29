import 'package:NJMLHA/screens/sellerLogin.dart';
import 'package:flutter/material.dart';
import 'package:NJMLHA/otp.dart';

class change_password extends StatefulWidget {
  const change_password({ Key? key }) : super(key: key);

  @override
  _Change_pawwordState createState() => _Change_pawwordState();
}

class _Change_pawwordState extends State<change_password> {
  @override
    final passwordController = TextEditingController();

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
                    builder: (context) => otp()
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
              
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: ListView(
                  children: [
                    
const Text(
  'New Password',
  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black, height: 5),
),
const Text(
  'Please enter the new password',
   style: TextStyle(color: Colors.black, fontSize: 20.0 ),
),                    
                    
                  
                    
                    
                    Container(
    
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Password: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your New password';
                          } else {}
                            return 'Please Enter Valid Email';
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
                    builder: (context) => sellerLogin()
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
                            'Save Password',
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