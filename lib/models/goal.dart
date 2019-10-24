import 'package:flutter/material.dart';

class Goal {
  final String text;
  final String decsText;
  final IconData icon;
  final Color color;
  final DateTime reminder;
  final DateTime date;


  Goal({this.text, this.decsText, this.icon, this.color,this.date,this.reminder});
}
