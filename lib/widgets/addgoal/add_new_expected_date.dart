import 'package:flutter/material.dart';

class AddNewExpectDate extends StatefulWidget {
  @override
  _AddNewExpectDateState createState() => _AddNewExpectDateState();
}

class _AddNewExpectDateState extends State<AddNewExpectDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('EXPECTED MATURITY DATE'),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: ListTile(
                leading: Text(
                  '50 YRS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            children: <Widget>[TextField()],
                          );
                        });
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
