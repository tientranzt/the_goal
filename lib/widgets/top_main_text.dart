import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '26 Goals',
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Happy day and got the goals 😘',
              style: TextStyle(fontSize: 17, color: Colors.grey)),
        ],
      ),
    );
  }
}
