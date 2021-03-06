import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class GoalListData extends ChangeNotifier {
  List _goalList = [];

  final List<Color> _colorData = [
    Colors.brown,
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

  final List<IconData> _iconData = [
    Icons.code,
    Icons.account_circle,
    Icons.add,
    Icons.account_balance,
    Icons.alarm,
    Icons.label,
    Icons.photo,
    Icons.list,
    Icons.input,
    Icons.print,
    Icons.title,
    Icons.photo_camera,
    Icons.add_alert,
    Icons.assessment,
    Icons.time_to_leave,
    Icons.memory,
    Icons.attach_money,
    Icons.beach_access,
    Icons.delete,
    Icons.done,
    Icons.create,
    Icons.call,
    Icons.airline_seat_flat,
    Icons.search,
    Icons.ac_unit,
    Icons.add_location,
    Icons.account_balance_wallet,
    Icons.airline_seat_individual_suite,
    Icons.airplanemode_active,
    Icons.attach_file,
    Icons.airport_shuttle,
    Icons.atm,
    Icons.audiotrack,
    Icons.cancel,
    Icons.brightness_3,
    Icons.build,
    Icons.cake,
    Icons.child_care,
    Icons.child_friendly,
    Icons.computer,
    Icons.enhanced_encryption,
    Icons.event,
    Icons.face,
    Icons.fastfood,
    Icons.favorite,
    Icons.feedback,
    Icons.free_breakfast,
    Icons.gps_fixed,
    Icons.help,
    Icons.hourglass_empty,
    Icons.insert_comment,
    Icons.lightbulb_outline,
    Icons.local_hospital,
    Icons.local_laundry_service
  ];

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/thegoal.txt');
  }

  Future<File> writeListGoalToFile(List goalListData) async {
    final file = await _localFile;
    file.exists().then((value) {
      if (!value) file.createSync();
    });
    var jsonCode = jsonEncode(goalListData);
    return file.writeAsString('$jsonCode');
  }

  Future<List<dynamic>> readGoalList() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      _goalList = jsonDecode(contents);
      return jsonDecode(contents);
    } catch (e) {
      return [];
    }
  }

  void checkDone(int index) {
    _goalList[index]['isDone'] = _goalList[index]['isDone'] == 1 ? 0 : 1;
    writeListGoalToFile(_goalList);
    notifyListeners();
  }

  void addItemToListGoal(goal) {
    _goalList.add(goal);
    writeListGoalToFile(_goalList);
    notifyListeners();
  }

  void removeGoalFromList(int indexGoal) {
    _goalList.removeAt(indexGoal);
    writeListGoalToFile(_goalList);
    notifyListeners();
  }

  int countGoalDone() {
    int count = 0;
    _goalList.forEach((goal) {
      if (goal['isDone'] == 1) count++;
    });
    return count;
  }

  int countGoalNearDone() {
    int countDayNearDone = 0;
    _goalList.forEach((goal) {
      var now = DateTime.now();
      var dateExpected = DateTime.parse(goal['dateExpected']);
      if (dateExpected.difference(now).inDays <= 10) {
        countDayNearDone++;
      }
    });
    return countDayNearDone;
  }

  int countNewGoal() {
    int countDayNewGoal = 0;
    _goalList.forEach((goal) {
      var now = DateTime.now();
      var createDate = DateTime.parse(goal['createDate']);
      if (createDate.difference(now).inDays <= 3) {
        countDayNewGoal++;
      }
    });
    return countDayNewGoal;
  }

  void isReminder(int index) {
    if (_goalList.length > 0) {
      _goalList[index]['isReminder'] = 1;
      writeListGoalToFile(_goalList);
    }
  }

  int get getLengthGoalList => _goalList.length;

  List<Color> get colorList => _colorData;

  int get lengthColorList => _colorData.length;

  List<IconData> get iconList => _iconData;

  int get lengthIconList => _iconData.length;
}
