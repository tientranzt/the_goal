import 'package:flutter/material.dart';
import 'package:the_goal/widgets/addgoal/button_add_new.dart';
import 'package:the_goal/widgets/addgoal/all_content.dart';

class AddGoalContent extends StatelessWidget {
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
              child: AllContentAddNew()
            ),
          ),
          AddNewButton()
        ],
      ),
    );
  }
}
