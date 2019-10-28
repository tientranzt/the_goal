import 'package:flutter/material.dart';
import 'package:the_goal/models/goal.dart';
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

  IconData icon = Icons.alarm;

  Color color = Colors.blueAccent;

  DateTime reminder = DateTime.now();

  String reminderConent = '';

  DateTime dateExpected = DateTime.now();

  void setTextTitle(String currentTitle) {
    print(currentTitle);
    setState(() {
      textTitle = currentTitle;
    });
  }

  void setTextDesciption(String currentDecs) {
    print(currentDecs);
    setState(() {
      textDecsiption = currentDecs;
    });
  }

  void setIcon(IconData currentIcon) {
    setState(() {
      icon = currentIcon;
    });
  }

  void setColor(Color currentColor) {
    setState(() {
      color = currentColor;
    });
  }

  void setReminder(DateTime currentReminder) {
    print(currentReminder);
    setState(() {
      reminder = currentReminder;
    });
  }

  void setReminderContent(String content) {
    print(content);
    setState(() {
      reminderConent = content;
    });
  }

  void setDateExpected(DateTime pickDateExpected) {
    setState(() {
      dateExpected = pickDateExpected;
    });
  }

  void addGoalToList() {
    Goal goal = Goal(
      color: color,
      dateExpected: dateExpected,
      decsText: textDecsiption,
      icon: icon,
      reminder: reminder,
      text: textTitle,
    );
    Provider.of<GoalListData>(context).addItemToListGoad(goal);

    Navigator.pop(context);
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