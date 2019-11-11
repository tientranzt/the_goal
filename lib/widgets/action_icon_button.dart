import 'package:flutter/material.dart';
import 'package:the_goal/pages/add_goal.dart';

class ActionIconButton extends StatelessWidget {
  ActionIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.all(15),
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          size: 18,
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddGoal();
        }));
      },
      color: Colors.grey,
    );
  }
}
