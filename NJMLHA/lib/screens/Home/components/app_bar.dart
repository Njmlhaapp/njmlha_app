import 'package:flutter/material.dart';
import '../../customerLogin.dart';

AppBar homeAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications_on_rounded),
        onPressed: () {
          /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Notfi()
                )
              ); */
        },
        color: Colors.brown.shade400,
      )
    ],
  );
}
