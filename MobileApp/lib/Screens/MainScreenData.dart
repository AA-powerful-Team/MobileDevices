import 'package:flutter/material.dart';



//Global vars-------------------------------------------------------------------------------------

List<BacklogCanvasElem> ecList = [
  BacklogCanvasElem(
    elementColorIcon: Colors.purple,
    elementIconSymbol: Icon(
      Icons.assignment,
      color: Colors.white,
      size: 25,
    ),
    elementStatusname: 'To do',
    elementNumberTasks: 5,
  ),
  BacklogCanvasElem(
    elementColorIcon: Colors.orange,
    elementIconSymbol: Icon(
      Icons.assignment_late,
      color: Colors.white,
      size: 25,
    ),
    elementStatusname: 'In Progress',
    elementNumberTasks: 6,
  ),
  BacklogCanvasElem(
    elementColorIcon: Colors.blue[500],
    elementIconSymbol: Icon(
      Icons.assignment_turned_in,
      color: Colors.white,
      size: 25,
    ),
    elementStatusname: 'Done',
    elementNumberTasks: 25,
  )
];

List<Task> taskList = [
  Task(
    taskName: 'Mobile App',
    taskPriority: EnumPriority.HIGH,
    taskDescription: 'deserunt ullamco est sit aliqua dolor do amet sint',
    milestone: Date(1, 10, 2020),
  ),
];

List<String> titleList=[

'My Task',
'Recently Assigned',

];

final exampleOne = MainScreenUserData(
  screenUser: User(
      userName: 'Jane Copper',
      userRol: 'Product Manager',
      userPicPath: 'assets/Devicesavatar.png'),
   titles: titleList,
  canvasList: ecList, //canvas backlog list
  screenTasks: taskList, //Task descripotions list
);



List<String> monthString=['Jan','Feb','Mar','Apr','May','jun','jul','Aug','Sep','Oct','Nov','Dec'];



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


