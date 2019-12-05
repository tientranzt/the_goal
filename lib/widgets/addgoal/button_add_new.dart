import 'package:flutter/material.dart';

class AddNewButton extends StatelessWidget {
  final Function handleAddNewGoal;
  AddNewButton({this.handleAddNewGoal});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 18, bottom: 18),
      width: double.infinity,
      child: FlatButton(
        padding: EdgeInsets.all(14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFF396DF0),
        child: Text(
          'Add New',
          style: TextStyle(
              color: Colors.white, fontSize: 18),
        ),
        onPressed: () {
          handleAddNewGoal();
        },
      ),
    );
  }
}
