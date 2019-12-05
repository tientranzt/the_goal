import 'package:flutter/material.dart';
import 'package:the_goal/widgets/leading_icon_button.dart';
import 'package:the_goal/widgets/action_icon_button.dart';
import 'package:the_goal/widgets/top_home_screen.dart';
import 'package:the_goal/widgets/bottom_home_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF0F2),
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Color(0xFF396DF0),
        elevation: 0,
        leading: LeadingButtonIcon(),
        title: Text(
          'TheGoal',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        actions: <Widget>[ActionIconButton()],
      ),
      body: SingleChildScrollView(
          child: Column(
              children: <Widget>[TopHomeScreenBody(), BottomHomeScreen()])),
    );
  }
}
