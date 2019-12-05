import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_goal/models/goal_list_data.dart';
import 'package:the_goal/widgets/bottom_goal_title.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    var android = AndroidInitializationSettings('app_icon');
    var ios = IOSInitializationSettings();
    var setting = InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(setting);
  }

  void showNotificationSchedule(
      int indexGoal, DateTime scheduledDate, String content) async {
    var android = new AndroidNotificationDetails('id', 'name', 'description');
    var ios = new IOSNotificationDetails();
    NotificationDetails platformChannel = new NotificationDetails(android, ios);
    await flutterLocalNotificationsPlugin.schedule(
        indexGoal, 'Goal List', '$content', scheduledDate, platformChannel);
    GoalListData goalListData = GoalListData();
    goalListData.isReminder(indexGoal);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<GoalListData>(context).readGoalList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        var listGoal = snapshot.data;

        if (listGoal == null) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (listGoal.length == 0) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Add more goal which top right button',
                style: TextStyle( fontSize: 16),
              ),
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
              var contentRiminder = listGoal[index]['reminderContent'];
              var dateRiminder = DateTime.parse(listGoal[index]['reminder']);
              if (listGoal[index]['isReminder'] == 0) {
                Provider.of<GoalListData>(context).isReminder(index);
                showNotificationSchedule(index, dateRiminder, contentRiminder);
              }
              return BottomGoalTitle(
                  indexGoal: index,
                  text: '${listGoal[index]['text']}',
                  decsText: '${listGoal[index]['decsText']}',
                  color: listGoal[index]['color'],
                  icon: listGoal[index]['icon'],
                  isDone: listGoal[index]['isDone'],
                  createDate: listGoal[index]['createDate'],
                  dateExpected: listGoal[index]['dateExpected'],
                  reminderContent: listGoal[index]['reminderContent'],
                  dateReminder: listGoal[index]['reminder']);
            },
            itemCount: listGoal.length,
          ),
        );
      },
    );
  }
}
