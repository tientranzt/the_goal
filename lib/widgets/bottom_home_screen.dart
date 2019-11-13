import 'package:flutter/material.dart';
import 'package:the_goal/models/goal_list_data.dart';
import 'package:the_goal/widgets/bottom_goal_title.dart';
import 'package:provider/provider.dart';

class BottomHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<GoalListData>(context).readGoalList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data.length == 0) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text('Add more goal which top right button'),
            ),
          );
        }
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
                  indexGoal: index,
                  text: '${snapshot.data[index]['text']}',
                  decsText: '${snapshot.data[index]['decsText']}',
                  color: snapshot.data[index]['color'],
                  icon: snapshot.data[index]['icon'],
                  isDone: snapshot.data[index]['isDone'],
                  createDate: snapshot.data[index]['createDate'],
                  dateExpected: snapshot.data[index]['dateExpected'],
                  reminderContent: snapshot.data[index]['reminderContent'],
                  dateReminder: snapshot.data[index]['reminder']);
            },
            itemCount: snapshot.data.length,
          ),
        );
      },
    );
  }
}
