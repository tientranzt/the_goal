import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewExpectDate extends StatelessWidget {
  final DateTime pickDate;
  final handleDateExpected;
  AddNewExpectDate({this.pickDate, this.handleDateExpected});
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
                  '${DateFormat.yMMMd().format(pickDate)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: FlatButton(
                  onPressed: () {
                    showDatePicker(
                      locale: Locale('vi'),
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2050),
                    ).then((value) {
                      handleDateExpected(value);
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
