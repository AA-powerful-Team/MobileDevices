import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:helloflutter/Screens/MainScreen.dart';





class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AssignmentOne',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MainUserScreen(),
    );
  }
}
