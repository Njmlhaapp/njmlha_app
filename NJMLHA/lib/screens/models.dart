import 'package:flutter/material.dart';

class SupportItms{
String? text;
List<SupportItemText>? itemsText;
SupportItms({this.text,this.itemsText});
}

////////////////////////////////

class  SupportItemText {
  String? title;
  String? subtitle;
  SupportItemText({
    this.title,
    this.subtitle
  });
}