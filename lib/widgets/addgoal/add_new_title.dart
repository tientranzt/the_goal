import 'package:flutter/material.dart';

class AddNewTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('GOAL TITLE'),
        Container(
          padding: EdgeInsets.only(bottom: 15, top: 15),
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  hintText: 'Save \$50.000',
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(15)))),
            ),
          ),
        ),

      ],
    );
  }
}
