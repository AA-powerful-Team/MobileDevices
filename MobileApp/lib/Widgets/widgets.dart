import 'package:flutter/material.dart';
import '../Screens/MainScreenData.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String rol;
  final String path;

  const UserInfo({
    @required this.name,
    @required this.rol,
    @required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  '$name',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '$rol',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset('$path'),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskStatus extends StatelessWidget {
  //State of task list

  final Color colorIcon;
  final Icon iconSymbol;
  final String statusname;
  final int numberTasks;

  const TaskStatus({
    @required this.colorIcon,
    @required this.iconSymbol,
    @required this.statusname,
    @required this.numberTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // to do 5 tasks
      flex: 1,
      child: Row(
        children: [
          Container(
            // color square
            decoration: BoxDecoration(
              color: colorIcon,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: Container(
              // icon inside the square
              padding: EdgeInsets.all(15),
              child: iconSymbol,
            ),
          ),
          SizedBox(width: 15),
          Text(
            '$statusname',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Text(
            '$numberTasks tasks',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class TaskInformation extends StatelessWidget {
  final String taskName;
  final EnumPriority taksPriority;
  final String description;
  final Date date;

  const TaskInformation({
    @required this.taskName,
    @required this.taksPriority,
    @required this.description,
    @required this.date,
  });

  //Description and data about task
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange[600],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Text(
                          '$taskName',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 150),
                        Spacer(),
                        Text(
                          returnStringPriority(taksPriority),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    flex: 4,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '$description',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    )),
                Divider(height: 20),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.timelapse),
                        SizedBox(width: 20),
                        Text(
                          returnStringDate(date.day, date.month, date.year),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  String returnStringDate(int d, int m, int y) => '$d/$m/$y';

  String returnStringPriority(EnumPriority p) {
    String taskP;

    switch (p) {
      case EnumPriority.HIGH:
        taskP = 'High Priority';

        break;
      case EnumPriority.MID:
        taskP = 'Mid Priority';

        break;

      case EnumPriority.LOW:
        taskP = 'Low Priority';

        break;
    }

    return taskP;
  }
}
