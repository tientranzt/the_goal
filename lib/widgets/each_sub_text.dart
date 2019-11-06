import 'package:flutter/material.dart';

class EachSubText extends StatelessWidget {
  final String text;
  final int number;

  EachSubText({this.text, this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$number',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
