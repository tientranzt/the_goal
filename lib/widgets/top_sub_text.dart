import 'package:flutter/material.dart';
import 'package:the_goal/widgets/each_sub_text.dart';
import 'package:provider/provider.dart';
import 'package:the_goal/models/goal_list_data.dart';

class SubText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: Provider.of<GoalListData>(context).readGoalList(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  EachSubText(
                    text: 'NEW ITEMS',
                    number: 0,
                  ),
                  EachSubText(
                    text: 'NEAR DONE',
                    number: 0,
                  ),
                  EachSubText(
                    text: 'COMPLETED',
                    number: 0,
                  ),
                ],
              ),
            );
          }
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                EachSubText(
                  text: 'NEW ITEMS',
                  number: Provider.of<GoalListData>(context).countNewGoal(),
                ),
                EachSubText(
                  text: 'NEAR DONE',
                  number:
                      Provider.of<GoalListData>(context).countGoalNearDone(),
                ),
                EachSubText(
                  text: 'COMPLETED',
                  number: Provider.of<GoalListData>(context).countGoalDone(),
                ),
              ],
            ),
          );
          ;
        });
  }
}
