import 'package:flutter/material.dart';

class searchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const searchBox({
    Key? key, 
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: Colors.brown.shade400.withOpacity(0.32),
      ),
    ),
    child:  TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
      border: InputBorder.none,
      icon: Icon(Icons.search),
      hintText: "Search Here",
      ), 
    ) ,
    );
  }
}