import 'package:flutter/material.dart';

class AddNewDescription extends StatelessWidget {
  Function handleDescription;

  AddNewDescription({this.handleDescription});

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
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {
                handleDescription(value);
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(13),
                  hintStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  hintText: 'Some description here for detail your goal',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
              maxLines: 4,
            ),
          ),
        )
      ],
    );
  }
}
