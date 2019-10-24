import 'package:flutter/material.dart';

class BottomGoalTitle extends StatelessWidget {
  final String text;
  final String decsText;
  final IconData icon;
  final Color color;

  BottomGoalTitle({this.text, this.decsText, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          leading: CircleAvatar(
            radius: 30,
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            backgroundColor: color,
          ),
          subtitle: Text(
            decsText,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
