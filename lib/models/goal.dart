import 'package:flutter/material.dart';

class Goal {
  final String text;
  final String decsText;
  final int icon;
  final int color;
  final DateTime reminder;
  final DateTime dateExpected;
  final DateTime createDate;
  int isDone;

  Goal(
      {this.text,
      this.decsText,
      this.icon,
      this.color,
      this.reminder,
      this.dateExpected,
      this.createDate,
      this.isDone = 0});

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'decsText': decsText,
      'icon': icon,
      'color': color,
      'reminder': reminder,
      'dateExpected': dateExpected,
      'createDate': createDate,
      'isDone': isDone
    };
  }
}
