import 'package:flutter/material.dart';
import 'package:the_goal/widgets/addgoal/add_new_title.dart';
import 'package:the_goal/widgets/addgoal/add_new_description.dart';
import 'package:the_goal/widgets/addgoal/add_new_icon.dart';
import 'package:the_goal/widgets/addgoal/add_new_color.dart';
import 'package:the_goal/widgets/addgoal/add_new_reminder.dart';
import 'package:the_goal/widgets/addgoal/add_new_expected_date.dart';

class AllContentAddNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AddNewTitle(),
        AddNewDescription(),
        AddNewIcon(),
        AddNewColor(),
        AddNewReminder(),
        AddNewExpectDate()
      ],
    );
  }
}
