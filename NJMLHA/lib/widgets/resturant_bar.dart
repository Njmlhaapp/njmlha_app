import 'package:NJMLHA/screens/Home/home-screen.dart';
import 'package:flutter/material.dart';

class ResturantBar extends StatelessWidget {
final IconData  leftIcon;

//final Function? leftCallback;
 ResturantBar(this.leftIcon, /*this.leftCallback*/);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen()
                  )
                );

            }, 
            child: _buildIcon(leftIcon),
          ),
           
        ],
      ),
   
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:Colors.white,
            ),
            child:Icon(icon),
          );
  }
}