import 'package:flutter/material.dart';

class AddNewTitle extends StatelessWidget {
  final Function handleTitle;
  AddNewTitle({this.handleTitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('GOAL TITLE',
            style: TextStyle(fontFamily: 'DancingBold', fontSize: 14)),
        Container(
          padding: EdgeInsets.only(bottom: 15, top: 15),
          child: Container(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                handleTitle(value);
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14),
                  hintStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  hintText: 'Save \$50.000',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
        )
      ],
    );
  }
}
