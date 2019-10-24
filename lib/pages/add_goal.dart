import 'package:flutter/material.dart';
import 'package:the_goal/widgets/addgoal/add_goal_content.dart';
class AddGoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4E5EB),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Color(0xFFE4E5EB),
        centerTitle: true,
        title: Text(
          'Add New Goal',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:AddGoalContent()
    );
  }
}
