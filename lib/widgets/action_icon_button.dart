import 'package:flutter/material.dart';
import 'package:the_goal/pages/add_goal.dart';

class ActionIconButton extends StatelessWidget {
  ActionIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(15),
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return AddGoal();
        }));
      },
      color: Colors.grey,
    );
  }
}
