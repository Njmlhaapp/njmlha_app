import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:NJMLHA/screens/privacy_policy.dart';

class CustomerSetting extends StatefulWidget {
  @override
  _CustomerSettingState createState() => _CustomerSettingState();
} // class CustomerSetting

class _CustomerSettingState extends State<CustomerSetting> {
  
  bool state1 = true;
  bool state2 = true;
  bool state3 = true;
  bool state4 = true;

  onChangeFunction1(bool newValue1) {setState(() {state1 = newValue1;});}
  onChangeFunction2(bool newValue2) {setState(() {state2 = newValue2;});}
  onChangeFunction3(bool newValue3) {setState(() {state3 = newValue3;});}
  onChangeFunction4(bool newValue4) {setState(() {state4 = newValue4;});}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 40),

            Row(
              children: [
                Icon(
                  Icons.settings_outlined,
                  color: Colors.brown.shade200
                ),

                SizedBox(width: 8),

                Text(
                  "Application",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ], // children
            ),

            Divider(height: 15, thickness: 2),
            SizedBox(height: 10),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Language", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600],),
                ),
                IconButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Language", style: TextStyle(color: Colors.brown.shade200)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(onPressed: (){}, child: Text("English", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600],),),),
                              TextButton(onPressed: (){}, child: Text("Arabic", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600],),),)
                            ], // children
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, // onPressed
                              child: Text("Close")
                            ),
                          ], // actions
                        );
                      } // builder
                    ); // showDialog
                  }, // onPressed
                  icon: new Icon(Icons.arrow_forward_ios, color: Colors.brown.shade200)
                ),
              ], // children
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Privacy and Policy", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600],),
                ),
                IconButton(
                  onPressed: (){
                    /*
                    () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>  PrivacyPolicy()));
                    */
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                    );
                  },
                  icon: new Icon(Icons.arrow_forward_ios, color: Colors.brown.shade200)
                ),
              ], // children
            ),
            
            SizedBox(height: 40),

            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.brown.shade200,
                ),

                SizedBox(width: 8),

                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ], // children
            ),
            
            Divider(height: 15, thickness: 2),
            SizedBox(height: 10),
            
            NotificationOptionSwitch("Accept Order", state1, onChangeFunction1),
            NotificationOptionSwitch("Reject Order", state2, onChangeFunction2),
            NotificationOptionSwitch("Order Complete", state3, onChangeFunction3),
            NotificationOptionSwitch("Order Evaluation", state4, onChangeFunction4),
            
          ], // children
        ),
      ),
    );
  } // Widget build

  Widget NotificationOptionSwitch(String title, bool state, Function onChangeMethod) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600])),
          CupertinoSwitch(
            activeColor: Colors.brown.shade200,
            value: state,
            onChanged: (newValue) {
              onChangeMethod(newValue);
            }, // onChanged
          )
      ], // children
    );
  } // Widget NotificationOptionSwitch
} // class _CustomerSettingState