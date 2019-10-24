import 'package:flutter/material.dart';

class AddNewReminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('REMINDER'),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListTile(
                leading: Text(
                  '5th of every month',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: FlatButton(
                  onPressed: () {
                    print('Reminder');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Change',
                    style: TextStyle(color: Color(0xFF396DF0)),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
