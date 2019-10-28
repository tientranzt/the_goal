import 'package:flutter/material.dart'; // use foundation if not widget
import 'package:the_goal/models/goal.dart';

class GoalListData extends ChangeNotifier {
  final List<Goal> _goalList = [
//    Goal(
//      color: Colors.yellowAccent,
//      text: 'Do More',
//      decsText: 'Good habit can make people to success!',
//      icon: Icons.print,
//    ),
//    Goal(
//      color: Colors.pink,
//      text: 'Gym Always',
//      decsText: 'Good habit can make people to success!',
//      icon: Icons.account_balance,
//    ),
//    Goal(
//      color: Colors.tealAccent,
//      text: 'Learn English',
//      decsText: 'Good habit can make people to success!',
//      icon: Icons.photo,
//    ),
//    Goal(
//      color: Colors.deepOrange,
//      text: 'Eat More',
//      decsText: 'Good habit can make people to success!',
//      icon: Icons.label,
//    ),
//    Goal(
//      color: Colors.blueAccent,
//      text: 'Meditation',
//      decsText: 'Good habit can make people to success!',
//      icon: Icons.account_box,
//    ),
//    Goal(
//      color: Colors.tealAccent,
//      text: 'Learn English',
//      decsText: 'Good habit can make people to success!',
//      icon: Icons.photo,
//    ),
//    Goal(
//      color: Colors.yellowAccent,
//      text: 'Do More',
//      decsText: 'Good habit can make people to success!',
//      icon: Icons.print,
//    ),
    Goal(
      color: Colors.blueAccent,
      text: 'Meditation',
      decsText: 'Good habit can make people to success!',
      icon: Icons.account_box,
    ),
  ];

  void addItemToListGoad(Goal goal) {
    _goalList.add(goal);
  }

  List<Goal> get getGoalList {
    return _goalList;
  }

  int get getLengthGoalList {
    return _goalList.length;
  }
}
