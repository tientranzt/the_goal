import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_goal/models/goal_list_data.dart';

class BottomGoalTitle extends StatelessWidget {
  final int indexGoal;
  final String text;
  final String decsText;
  final int icon;
  final int color;
  final int isDone;

  BottomGoalTitle(
      {this.text,
      this.decsText,
      this.icon,
      this.color,
      this.indexGoal,
      this.isDone});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<GoalListData>(context).removeGoalFromList(indexGoal);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
      key: ObjectKey(text),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(6),
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Provider.of<GoalListData>(context).colorList[color],
                ),
              ),
              child: CircleAvatar(
                radius: 26,
                child: Icon(
                  Provider.of<GoalListData>(context).iconList[icon],
                  size: 26,
                  color: Provider.of<GoalListData>(context).colorList[color],
                ),
                backgroundColor: Colors.white,
              ),
            ),
            subtitle: Text(
              decsText,
              style: TextStyle(fontSize: 13),
              maxLines: 2,
            ),
            trailing: GestureDetector(
              onTap: () {
                Provider.of<GoalListData>(context).checkDone(indexGoal);
              },
              child: Icon(
                Icons.done,
                color: isDone == 1 ? Colors.green : Colors.grey,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
