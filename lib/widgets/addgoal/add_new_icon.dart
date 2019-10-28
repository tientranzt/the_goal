import 'package:flutter/material.dart';

class AddNewIcon extends StatelessWidget {
  final IconData pickIcon;
  final Function handleIcon;
  AddNewIcon({this.pickIcon, this.handleIcon});

  final List<IconData> iconData = [
    Icons.account_circle,
    Icons.add,
    Icons.account_box,
    Icons.account_balance,
    Icons.alarm,
    Icons.label,
    Icons.photo,
    Icons.list,
    Icons.input,
    Icons.print,
    Icons.remove,
    Icons.more,
    Icons.title,
    Icons.photo_camera,
    Icons.access_alarm,
    Icons.add_alert,
    Icons.adjust,
    Icons.arrow_forward_ios,
    Icons.airline_seat_flat,
    Icons.assessment,
    Icons.time_to_leave,
    Icons.memory,
    Icons.border_inner,
    Icons.battery_full,
    Icons.bluetooth,
    Icons.call_merge,
    Icons.brightness_1,
    Icons.backup,
    Icons.attach_money,
    Icons.bubble_chart,
    Icons.border_style,
  ];

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
                leading: Icon(pickIcon, color: Color(0xFF396DF0)),
                trailing: FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: GridView.builder(
                                itemCount: iconData.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                itemBuilder: (context, index) {
                                  return FlatButton(
                                      onPressed: () {
                                        handleIcon(iconData[index]);
                                        Navigator.pop(context);
                                      },
                                      child: IconButton(
                                        icon: Icon(
                                          iconData[index],
                                          size: 40,
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
