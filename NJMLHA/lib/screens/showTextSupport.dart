import 'package:flutter/material.dart';

class ShowTextSupport extends StatelessWidget {
  final List? text;
  final String? title;
  ShowTextSupport({this.text, this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 158, 149, 133),
        elevation: 0.0,
        title: Text(
          title!,
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: text!.length,
          itemBuilder: (ctx, index) {
            return Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text![index].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    text![index].subtitle,
                    style: TextStyle(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
