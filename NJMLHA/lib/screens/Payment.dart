import 'package:NJMLHA/screens/CustomerProfile/C_profile_screen.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _MyshoosePaymentState createState() => _MyshoosePaymentState();
} // class Payment

class _MyshoosePaymentState extends State<Payment> {
  bool _value = false;
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.brown.shade200,//Color(0xFFF5F5F5),

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
            child: Column(
          children: [
            buildListTileRadio("Apple Pay", 1, val),
            buildListTileRadio("Cash", 2, val),
            buildListTileRadio("Mada", 3, val),
            ListTile(
              title: Text(" Add a new card "),
              leading: Icon(Icons.add),
            ),
            RaisedButton(
                color: Colors.brown.shade200, //Color(0xFFF5F5F5),

                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CProfileScreen()),
                  );

                  //
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ))
          ],
        )));
  }

  ListTile buildListTileRadio(String title, int _value, int val) {
    return ListTile(
      title: Text(title),
      leading: Radio(
        value: _value,
        groupValue: val,
        onChanged: (value) {
          setState(() {
            val != value;
          });
        },
        activeColor: Colors.green,
      ),
    );
  }
}
