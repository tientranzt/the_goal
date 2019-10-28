import 'package:flutter/material.dart';

class Goal {
  final String text;
  final String decsText;
  final IconData icon;
  final Color color;
  final DateTime reminder;
  final DateTime dateExpected;

  Goal(
      {this.text,
      this.decsText,
      this.icon,
      this.color,
      this.dateExpected,
      this.reminder});
}
