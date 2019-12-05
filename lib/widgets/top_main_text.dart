import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_goal/models/goal_list_data.dart';

class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<GoalListData>(context).readGoalList(),
      builder: (context, snapshot) {
        return Container(
          child: Column(
            children: <Widget>[
              Text(
                '${Provider.of<GoalListData>(context).getLengthGoalList} Goals',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text('Have a nice day and got the goals 😘',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  )),
            ],
          ),
        );
      },
    );
  }
}
