import 'package:flutter/material.dart';

// Widgets DATA---------------------------------------------------------------------------
enum EnumPriority { HIGH, MID, LOW } //task priority enum

enum EnumTaskType{ALL } //type of tasks

class Date {
  //date limit for task
  int day, month, year;

//constructor
  Date(this.day, this.month, this.year);
}


//SCREEN DATA CLASSES


class MainScreenUserData {
  final User screenUser;
  final List<String>titles ;//NOTE: could be improve this may be relocated in the future.
  final List<BacklogCanvasElem> canvasList;
  final List<Task> screenTasks;


  MainScreenUserData({this.screenUser,this.titles,this.canvasList, this.screenTasks});
}

class User {
  final String userName;
  final String userRol;
  final String userPicPath;

  User({this.userName, this.userRol, this.userPicPath});
}

class BacklogCanvasElem {
  final Color elementColorIcon;
  final Icon elementIconSymbol;
  final String elementStatusname;
  final int elementNumberTasks;

  BacklogCanvasElem({
      this.elementColorIcon,
      this.elementIconSymbol,
      this.elementStatusname,
      this.elementNumberTasks});
      
}

class Task {
  final String taskName;
  final EnumPriority taskPriority;
  final String taskDescription;
  final Date milestone;

  Task({this.taskName, this.taskPriority, this.taskDescription,
      this.milestone});
}


