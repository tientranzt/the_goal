import 'package:flutter/material.dart';
import 'package:the_goal/widgets/addgoal/button_add_new.dart';
import 'package:the_goal/widgets/addgoal/add_new_title.dart';
import 'package:the_goal/widgets/addgoal/add_new_description.dart';
import 'package:the_goal/widgets/addgoal/add_new_icon.dart';
import 'package:the_goal/widgets/addgoal/add_new_color.dart';
import 'package:the_goal/widgets/addgoal/add_new_reminder.dart';
import 'package:the_goal/widgets/addgoal/add_new_expected_date.dart';
import 'package:provider/provider.dart';
import 'package:the_goal/models/goal_list_data.dart';

class AddGoalContainer extends StatefulWidget {
  @override
  _AddGoalContainerState createState() => _AddGoalContainerState();
}

class _AddGoalContainerState extends State<AddGoalContainer> {
  String textTitle = '';

  String textDecsiption = '';

  int icon = 1;

  int color = 1;

  DateTime reminder = DateTime.now();

  String reminderConent = '';

  DateTime dateExpected = DateTime.now();

  void setTextTitle(String currentTitle) {
    setState(() {
      textTitle = currentTitle;
    });
  }

  void setTextDesciption(String currentDecs) {
    setState(() {
      textDecsiption = currentDecs;
    });
  }

  void setIcon(int indexIcon) {
    setState(() {
      icon = indexIcon;
    });
  }

  void setColor(int indexColor) {
    setState(() {
      color = indexColor;
    });
  }

  void setReminder(DateTime currentReminder) {
    setState(() {
      reminder = currentReminder;
    });
  }

  void setReminderContent(String content) {
    setState(() {
      reminderConent = content;
    });
  }

  void setDateExpected(DateTime pickDateExpected) {
    setState(() {
      dateExpected = pickDateExpected;
    });
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          title: Text(
            'Oh no!',
            style: TextStyle( fontSize: 18),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Title and decsription must be fill',
                    style:
                        TextStyle(fontSize: 18)),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addGoalToList() {
    var goal = {
      "text": textTitle,
      "decsText": textDecsiption,
      "icon": icon,
      "color": color,
      "reminder": reminder.toString(),
      "dateExpected": dateExpected.toString(),
      "createDate": DateTime.now().toString(),
      "reminder": reminder.toString(),
      "reminderContent": reminderConent.isEmpty
          ? "The goal $textTitle reminder !"
          : reminderConent,
      "isDone": 0,
      "isReminder": 0,
    };
    if (goal['text'].toString().isEmpty &&
        goal['decsText'].toString().isEmpty) {
      _neverSatisfied();
    } else {
      Provider.of<GoalListData>(context).addItemToListGoal(goal);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              color: Color(0xFFE4E5EB),
            ),
            child: Container(
                padding:
                    EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AddNewTitle(
                      handleTitle: setTextTitle,
                    ),
                    AddNewDescription(
                      handleDescription: setTextDesciption,
                    ),
                    AddNewIcon(
                      handleIcon: setIcon,
                      pickIcon: icon,
                    ),
                    AddNewColor(
                      handleColor: setColor,
                      pickColor: color,
                    ),
                    AddNewReminder(
                      handleReminder: setReminder,
                      pickDayNotifications: reminder,
                      handleReminderContent: setReminderContent,
                    ),
                    AddNewExpectDate(
                      pickDate: dateExpected,
                      handleDateExpected: setDateExpected,
                    )
                  ],
                )),
          ),
          AddNewButton(
            handleAddNewGoal: addGoalToList,
          )
        ],
      ),
    );
  }
}
