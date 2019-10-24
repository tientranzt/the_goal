import 'package:flutter/material.dart';
import 'package:the_goal/widgets/bottom_goal_title.dart';
import 'package:the_goal/models/goal.dart';

class BottomHomeScreen extends StatelessWidget {
  final List<Goal> goalList = [
    Goal(
      color: Colors.yellowAccent,
      text: 'Do More',
      decsText: 'Good habit can make people to success!',
      icon: Icons.print,
    ),
    Goal(
      color: Colors.pink,
      text: 'Gym Always',
      decsText: 'Good habit can make people to success!',
      icon: Icons.account_balance,
    ),
    Goal(
      color: Colors.tealAccent,
      text: 'Learn English',
      decsText: 'Good habit can make people to success!',
      icon: Icons.photo,
    ),
    Goal(
      color: Colors.deepOrange,
      text: 'Eat More',
      decsText: 'Good habit can make people to success!',
      icon: Icons.label,
    ),
    Goal(
      color: Colors.blueAccent,
      text: 'Meditation',
      decsText: 'Good habit can make people to success!',
      icon: Icons.account_box,
    ),
    Goal(
      color: Colors.tealAccent,
      text: 'Learn English',
      decsText: 'Good habit can make people to success!',
      icon: Icons.photo,
    ),
    Goal(
      color: Colors.yellowAccent,
      text: 'Do More',
      decsText: 'Good habit can make people to success!',
      icon: Icons.print,
    ),
    Goal(
      color: Colors.blueAccent,
      text: 'Meditation',
      decsText: 'Good habit can make people to success!',
      icon: Icons.account_box,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFEEF0F2),
      ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return BottomGoalTitle(
            text: '${goalList[index].text}',
            decsText: '${goalList[index].decsText}',
            color: goalList[index].color,
            icon: goalList[index].icon,
          );
        },
        itemCount: goalList.length,
      ),
    );
  }
}
