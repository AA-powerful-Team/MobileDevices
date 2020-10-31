import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';
import 'MainScreenData.dart';
import 'package:provider/provider.dart';

//Global vars------------------------------------------------------

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
    milestone: Date(01, 10, 2020),
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

//---------------------------------------------------------

class MainUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MainScreenUserData>.value(
      value: exampleOne,
      child: Scaffold(
        body: Column(
          //Column One : STRUCTURE OF THE WHOLE SCREEN
          children: [
            Expanded(
              flex: 2,
              child: _BaseBackground(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BaseBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        //Column Two
        children: [
          Expanded(
            flex: 3,
            child: _UpperSegmentBGB(), //invisible Rect
          ),
          Expanded(
            flex: 2,
            child: _LowerSegmentBGB(),
          ),
        ],
      ),
    );
  }
}

class _LowerSegmentBGB extends StatelessWidget {
  //Lower part of the background base(BGB)

  @override
  Widget build(BuildContext context) {
    final MainScreenUserData screenData =
        Provider.of<MainScreenUserData>(context);
    return Container(
      //Green Rect
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),

      child: Container(
        //Inside the the lower part segmentBGB

        padding: EdgeInsets.only(
            left: 40, bottom: 10, right: 40, top: 5), //HARDCODED\
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: _LowerSegmentTitle(),
            ),
            Expanded(
              flex: 4, //middlebox
              child: TaskInformation(
                //NOTE: we should create a system to display multiple elems,we should create a for and  travel the list displaying each elem
                taskName: screenData.screenTasks[0].taskName,
                taksPriority: screenData.screenTasks[0].taskPriority,
                description: screenData.screenTasks[0].taskDescription,
                date: screenData.screenTasks[0].milestone,
              ),
            ),
            SizedBox(height: 15),
            Expanded(
                flex: 1, // icons bar
                child: Appbar())
          ],
        ),
      ),
    );
  }
}

class Appbar extends StatelessWidget {//NOTE: this will not be private due to its a future development widget
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.home,
          color: Colors.grey,
          size: 50,
        ),
        Icon(
          Icons.calendar_view_day_outlined,
          color: Colors.grey,
          size: 50,
        ),
        Icon(
          Icons.calendar_today_rounded,
          color: Colors.grey,
          size: 40,
        ),
        Icon(
          Icons.person,
          color: Colors.grey,
          size: 50,
        ),
      ],
    );
  }
}

class _LowerSegmentTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final MainScreenUserData screenData =
        Provider.of<MainScreenUserData>(context);
    return Row(
      //Text row type of task
      children: [
        Text(
         screenData.titles[1], //HARDCODED
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            fontSize: 30, 
          ),
        ),
        SizedBox(width: 100), 
        Spacer(),
        Text(
          returnStringTaskType(EnumTaskType.ALL),
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ), 
        ),
      ],
    );
  }
}

class _UpperSegmentBGB extends StatelessWidget {
  //Upper part of the background base(BGB)

  @override
  Widget build(BuildContext context) {
    final MainScreenUserData screenData =
        Provider.of<MainScreenUserData>(context);
    return Container(
      padding: EdgeInsets.only(
        top: 50,
        left: 30,
        right: 30,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: UserInfo(
                name: screenData.screenUser.userName,
                rol: screenData.screenUser.userRol,
                path: screenData.screenUser.userPicPath),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(
                left: 0,
                right: 0,
                bottom: 5,
                top: 5,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(45))),
                child: Row(
                  children: [
                    Text(
                      'Search', //HARDCODED
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        fontSize: 25, //HARDCODED
                      ),
                    ),
                    SizedBox(width: 20),
                    Spacer(),
                    Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            // my task HARDCODE
            flex: 1,
            child: Row(
              children: [
                Text(
                 screenData.titles[0], //HARDCODED
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 30, //HARDCODED
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          TaskStatus(
            //NOTE: we should create a system to display multiple elems,we should create a for and  travel the list displaying each elem
            colorIcon: screenData.canvasList[0].elementColorIcon,
            iconSymbol: screenData.canvasList[0].elementIconSymbol,
            statusname: screenData.canvasList[0].elementStatusname,
            numberTasks: screenData.canvasList[0].elementNumberTasks,
          ),
          TaskStatus(
            colorIcon: Colors.orange,
            iconSymbol: Icon(
              Icons.assignment_late,
              color: Colors.white,
              size: 25,
            ),
            statusname: 'In Progress',
            numberTasks: 6,
          ),
          TaskStatus(
            colorIcon: Colors.blue[500],
            iconSymbol: Icon(
              Icons.assignment_turned_in,
              color: Colors.white,
              size: 25,
            ),
            statusname: 'Done',
            numberTasks: 25,
          ),
        ],
      ),
    );
  }
}
