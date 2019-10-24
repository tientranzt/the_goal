import 'package:flutter/material.dart';

class AddNewColor extends StatefulWidget {
  @override
  _AddNewColorState createState() => _AddNewColorState();
}

class _AddNewColorState extends State<AddNewColor> {
  Color pickColor = Colors.blue;

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
                      borderRadius: BorderRadius.circular(15)),
                ),
                trailing: FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: GridView.builder(
                                itemCount: colorData.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                itemBuilder: (context, index) {
                                  return FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          pickColor = colorData[index];
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: CircleAvatar(
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
