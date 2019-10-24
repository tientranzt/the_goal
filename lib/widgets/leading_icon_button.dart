import 'package:flutter/material.dart';

class LeadinguttonIcon extends StatelessWidget {
  LeadinguttonIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
      padding: EdgeInsets.only(left: 15),
      icon: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.png')
//        child: Icon(Icons.account_circle),
      ),
    );
  }
}
