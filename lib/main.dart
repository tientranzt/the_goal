import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_goal/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_goal/models/goal_list_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => GoalListData(),
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'EN'),
          const Locale('vi', 'VN'),
        ],
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
