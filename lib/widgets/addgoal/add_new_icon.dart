import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_goal/models/goal_list_data.dart';

class AddNewIcon extends StatelessWidget {
  final int pickIcon;
  final Function handleIcon;

  AddNewIcon({this.pickIcon, this.handleIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('ICON'),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListTile(
                leading: Icon(
                    Provider.of<GoalListData>(context).iconList[pickIcon],
                    color: Color(0xFF396DF0)),
                trailing: FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: GridView.builder(
                                itemCount: Provider.of<GoalListData>(context)
                                    .lengthIconList,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),

                                itemBuilder: (context, index) {
                                  return FlatButton(

                                      onPressed: () {
                                        handleIcon(index);
                                        Navigator.pop(context);
                                      },
                                      child: IconButton(
                                        icon: Icon(
                                          Provider.of<GoalListData>(context)
                                              .iconList[index],
                                          size: 35,
                                        ),
                                      ));
                                }),
                          );
                        });
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Change',
                    style: TextStyle(color: Color(0xFF396DF0)),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
