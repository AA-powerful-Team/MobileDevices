
import 'package:flutter/material.dart';

// Widgets DATA---------------------------------------------------------------------------
enum EnumPriority { HIGH, MID, LOW }  //task priority enum

class Date {  //date limit for task
  int day, month, year;

//constructor
  Date(this.day, this.month, this.year);
}



//SCREEN DATA---------------------------------------------------------------------------
class User {
  final String userName;
  final String userRol;
  final String userPicPath;

  User({this.userName, this.userRol, this.userPicPath});
}

class BacklogCanvasElem {

  final Color backlogCanvasElement_ColorIcon;
  final Icon backlogCanvasElement_IconSymbol;
  final String backlogCanvasElement_Statusname;
  final int backlogCanvasElement_NumberTasks;


  BacklogCanvasElem(
      this.backlogCanvasElement_ColorIcon,
      this.backlogCanvasElement_IconSymbol,
      this.backlogCanvasElement_Statusname,
      this.backlogCanvasElement_NumberTasks
      );
}

class Task{

final String task_name;
final EnumPriority task_priority;
final String task_description;
final Date milestone;

  Task(this.task_name, this.task_priority, this.task_description, this.milestone);


}