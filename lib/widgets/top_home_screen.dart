import 'package:flutter/material.dart';
import 'package:the_goal/widgets/body_clipper.dart';
import 'package:the_goal/widgets/top_main_text.dart';
import 'package:the_goal/widgets/top_sub_text.dart';

class TopHomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BodyClipper(),
      child: Container(
        color: Color(0xFF396DF0),
        padding: EdgeInsets.only(top: 0, right: 12, left: 12, bottom: 30),
        height: 200,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MainText(),
              SubText(),
            ],
          ),
        ),
      ),
    );
  }
}
