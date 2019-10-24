import 'package:flutter/material.dart';
import 'package:the_goal/widgets/each_sub_text.dart';

class SubText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          EachSubText(
            text: 'NEW ITEMS',
            number: 25,
          ),
          EachSubText(
            text: 'NEAR DONE',
            number: 9,
          ),
          EachSubText(
            text: 'COMPLETED',
            number: 12,
          ),
        ],
      ),
    );
  }
}
