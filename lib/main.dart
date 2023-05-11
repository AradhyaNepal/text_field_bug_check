import 'package:flutter/material.dart';
import 'package:reprecating_textfield_bug/text_field_screen_with_bug.dart';
import 'package:reprecating_textfield_bug/welcome_screen.dart';

import 'more_down_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<List<String>> textFieldScreenAnalytics=ValueNotifier(["------------------------------------"]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageView(
        scrollDirection: Axis.vertical,
        children: [
          WelcomeScreen(
            textFieldScreenAnalytics: textFieldScreenAnalytics,
          ),
          const MoreDownScreen(),
          TextFieldBugScreen(textFieldScreenAnalytics: textFieldScreenAnalytics,),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textFieldScreenAnalytics.dispose();
  }
}