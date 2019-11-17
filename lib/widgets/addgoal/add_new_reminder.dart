import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AddNewReminder extends StatefulWidget {
  final DateTime pickDayNotifications;
  final Function handleReminder;
  final Function handleReminderContent;

  AddNewReminder(
      {this.handleReminder,
      this.pickDayNotifications,
      this.handleReminderContent});

  @override
  _AddNewReminderState createState() => _AddNewReminderState();
}

class _AddNewReminderState extends State<AddNewReminder> {
  var datePick;

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
                  '${DateFormat.yMMMd().format(widget.pickDayNotifications)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                trailing: FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (context, setstate) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                  padding: const EdgeInsets.all(15),
                                  height: 220,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        TextField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              labelText:
                                                  'Notifications content'),
                                          onChanged: (value) {
                                            widget.handleReminderContent(value);
                                          },
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        ListTile(
                                          leading: Text(
                                            datePick == null
                                                ? '${DateFormat.yMMMd().format(DateTime.now())}'
                                                : '${DateFormat.yMMMd().format(datePick)}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          trailing: FlatButton(
                                            onPressed: () {
                                              showDatePicker(
                                                locale: Locale('en'),
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2019),
                                                lastDate: DateTime(2050),
                                              ).then((value) {
                                                print(value);
                                                var checkDateReminderValue =
                                                    value == null
                                                        ? DateTime.now()
                                                        : value;
                                                setstate(() {
                                                  datePick = value;
                                                });
                                                widget.handleReminder(
                                                    checkDateReminderValue);
                                              });
                                            },
                                            splashColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            padding: EdgeInsets.only(left: 30),
                                            child: Text(
                                              'Choose',
                                              style: TextStyle(
                                                  color: Color(0xFF396DF0)),
                                            ),
                                          ),
                                        ),
                                        FlatButton(
                                          child: Text(
                                            'OK',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: Colors.blueAccent,
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          });
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
