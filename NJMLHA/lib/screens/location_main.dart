import 'package:NJMLHA/components/search-box.dart';
import 'package:NJMLHA/constants/constants.dart';
import 'package:NJMLHA/screens/Home/home-screen.dart';
import 'package:flutter/material.dart';

class LocationMain extends StatelessWidget {
  const LocationMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 131, 160, 139),

        title: ( Text("Location")
        ),
        leading: IconButton(
          onPressed: () {}, 
          icon: Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
        
      ),
      
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/thelocation.png",
            
            ),SizedBox(height: 60),
            SizedBox(height: 60,
      width: 250,
      child: RaisedButton(
        color: Colors.grey.withOpacity(0.3),
        onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen()
                    )
                  );},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "Save",
          style: TextStyle(color:kTextColor, fontSize: 20),
        ),
      ),),
           
          
          ],
        ),
        
      ),
      
    );
    
  }
}

