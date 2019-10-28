import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_goal/models/goal_list_data.dart';
import 'package:the_goal/widgets/bottom_goal_title.dart';

class BottomHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GoalListData>(
      builder: (context, goalData, child) {
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
                text: '${goalData.getGoalList[index].text}',
                decsText: '${goalData.getGoalList[index].decsText}',
                color: goalData.getGoalList[index].color,
                icon: goalData.getGoalList[index].icon,
              );
            },
            itemCount: goalData.getLengthGoalList,
          ),
        );
      },
    );
  }
}
