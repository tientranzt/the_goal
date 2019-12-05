import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_goal/models/goal_list_data.dart';

class AddNewColor extends StatelessWidget {
  final int pickColor;
  final Function handleColor;

  AddNewColor({this.pickColor, this.handleColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('COLOR',
            style: TextStyle(fontFamily: 'DancingBold', fontSize: 14)),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListTile(
                leading: FlatButton(
                  child: null,
                  color:
                      Provider.of<GoalListData>(context).colorList[pickColor],
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                trailing: FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: GridView.builder(
                                itemCount: Provider.of<GoalListData>(context)
                                    .lengthColorList,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                itemBuilder: (context, index) {
                                  return FlatButton(
                                      onPressed: () {
                                        handleColor(index);
                                        Navigator.pop(context);
                                      },
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor:
                                            Provider.of<GoalListData>(context)
                                                .colorList[index],
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
