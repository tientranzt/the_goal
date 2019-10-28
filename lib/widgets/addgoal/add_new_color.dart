import 'package:flutter/material.dart';

class AddNewColor extends StatelessWidget {
  final Color pickColor;
  final Function handleColor;
  AddNewColor({this.pickColor, this.handleColor});

  final List<Color> colorData = [
    Colors.grey,
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.deepOrange,
    Colors.indigo,
    Colors.red,
    Colors.black87,
    Colors.tealAccent,
    Colors.amberAccent,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.lightBlueAccent,
    Colors.blueAccent,
    Colors.pink,
    Colors.deepOrangeAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('COLOR'),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListTile(
                leading: FlatButton(
                  child: null,
                  color: pickColor,
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
                                itemCount: colorData.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                itemBuilder: (context, index) {
                                  return FlatButton(
                                      onPressed: () {
                                        handleColor(colorData[index]);
                                        Navigator.pop(context);
                                      },
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: colorData[index],
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
