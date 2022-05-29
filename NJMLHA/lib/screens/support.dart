import 'package:NJMLHA/screens/models.dart';
import 'package:NJMLHA/screens/showTextSupport.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  List<SupportItms> supports = [
    SupportItms(
      text: "Help Center",
      itemsText: [
        SupportItemText(
            title: "How we can help", subtitle: "Hello iam Sub Title"),
        SupportItemText(
            title: "Hello Iam Title", subtitle: "Hello iam Sub Title"),
      ],
    ),
    //1
    SupportItms(
      text: "General",
      itemsText: [
        SupportItemText(
            title: "What is Njmlha",
            subtitle:
                "Njmlha It is an ordering application that makes it easier for students and employees and contributes to reducing time and effort, and collects all stores on campus"),
      ],
    ),
    //2
    SupportItms(
      text: "Order Related",
      itemsText: [
        SupportItemText(
            title: "Do i need to register to place an order?",
            subtitle:
                "Yes, to complete the application, you must enter your university email and password"),
      ],
    ),
    //3
    SupportItms(
      text: "Rider",
      itemsText: [
        SupportItemText(
            title:
                "What if the required documents are not completed can i proceed with rhe register? ",
            subtitle:
                "yes, you will get a message with a link to complete the registration process"),
      ],
    ),
    //4
    SupportItms(
      text: "About Njmlha",
      itemsText: [
        SupportItemText(
            title: "About Njmlha",
            subtitle:
                " we created an ordering application that makes it easier for tudents and employees and contributes to reducing time and effort brings together all the stores on campus, and helps in increasing productivity."),
      ],
    ),
    //5
    SupportItms(
      text: "Terms Of Service",
      itemsText: [
        SupportItemText(title: "Hello Iam Title", subtitle: " "),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 158, 149, 133),
        elevation: 0.0,
        title: Text(
          "Support",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: supports.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(supports[index].text!),
            leading: index == 0 ? Icon(Icons.help_center) : null,
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowTextSupport(
                            text: supports[index].itemsText,
                            title: supports[index].text,
                          )));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1.5,
          );
        },
      ),
    );
  }
}
