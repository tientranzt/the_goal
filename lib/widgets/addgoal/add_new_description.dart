import 'package:flutter/material.dart';

class AddNewDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('GOAL DESCRIPTION'),
        Container(
          padding: EdgeInsets.only(bottom: 15, top: 15),
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  hintText: 'Some description here for detail your goal',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }
}
