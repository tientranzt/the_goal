import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_goal/models/goal_list_data.dart';
import 'package:the_goal/widgets/bottom_goal_title.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:the_goal/pages/home_page.dart';

class BottomHomeScreen extends StatefulWidget {
  @override
  _BottomHomeScreenState createState() => _BottomHomeScreenState();
}

class _BottomHomeScreenState extends State<BottomHomeScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var android = AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  void showNotificationSchedule(int indexGoal,
      DateTime scheduledNotificationDateTime, String content) async {
    var androidPlatformChannelSpecifics =
        new AndroidNotificationDetails('id', 'name', 'description');
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(0, 'Goal Application',
        '$content', scheduledNotificationDateTime, platformChannelSpecifics);
    GoalListData goalListData = GoalListData();
    goalListData.isReminder(indexGoal);
  }

  Future onSelectNotification(String payload) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<GoalListData>(context).readGoalList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data.length == 0) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text('Add more goal which top right button'),
            ),
          );
        }
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFEEF0F2),
          ),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var contentRiminder = snapshot.data[index]['reminderContent'];
              var dateRiminder =
                  DateTime.parse(snapshot.data[index]['reminder']);
              if (snapshot.data[index]['isReminder'] == 0) {
                Provider.of<GoalListData>(context).isReminder(index);
                showNotificationSchedule(index, dateRiminder, contentRiminder);
              }

              return BottomGoalTitle(
                  indexGoal: index,
                  text: '${snapshot.data[index]['text']}',
                  decsText: '${snapshot.data[index]['decsText']}',
                  color: snapshot.data[index]['color'],
                  icon: snapshot.data[index]['icon'],
                  isDone: snapshot.data[index]['isDone'],
                  createDate: snapshot.data[index]['createDate'],
                  dateExpected: snapshot.data[index]['dateExpected'],
                  reminderContent: snapshot.data[index]['reminderContent'],
                  dateReminder: snapshot.data[index]['reminder']);
            },
            itemCount: snapshot.data.length,
          ),
        );
      },
    );
  }
}
