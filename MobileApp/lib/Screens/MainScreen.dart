import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class MainUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //Column One : STRUCTURE OF THE WHOLE SCREEN
        children: [
          Expanded(
            flex: 2,
            child: BaseBackground(),
          ),
        ],
      ),
    );
  }
}

class BaseBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        //Column Two
        children: [
          Expanded(
            flex: 3,
            child: UpperSegmentBGB(), //invisible Rect
          ),
          Expanded(
            flex: 2,
            child: LowerSegmentBGB(),
          ),
        ],
      ),
    );
  }
}

class LowerSegmentBGB extends StatelessWidget {
  //Lower part of the background base(BGB)

  @override
  Widget build(BuildContext context) {
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
              child: LowerSegmentTitle(),
            ),
            Expanded(
              flex: 4, //middlebox
              child: TaskInformation(
                taskName: 'Mobile App',
                taksPriority: EnumPriority.HIGH,
                description: 'lorem ipsum blablalbalblablal',
                date: Date(01,10,2020),
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

class Appbar extends StatelessWidget {
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
          Icons.home,
          color: Colors.grey,
          size: 50,
        ),
        Icon(
          Icons.home,
          color: Colors.grey,
          size: 50,
        ),
        Icon(
          Icons.home,
          color: Colors.grey,
          size: 50,
        ),
      ],
    );
  }
}

class LowerSegmentTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      //Text row type of task
      children: [
        Text(
          'Recently Assigned', //HARDCODED
          style: TextStyle(
            fontFamily: '',
            fontSize: 25, //HARDCODED
          ),
        ),
        SizedBox(width: 150), //HARDCODED
        Spacer(),
        Text(
          'All tasks',
          style: TextStyle(fontFamily: '', fontSize: 15), //HARDCODED
        ),
      ],
    );
  }
}

class UpperSegmentBGB extends StatelessWidget {
  //Upper part of the background base(BGB)

  @override
  Widget build(BuildContext context) {
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
                name: 'Adrian Font',
                rol: 'Project Manager',
                path: 'assets/Devicesavatar.png'),
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
                        fontFamily: '',
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
                  'My Task', //HARDCODED
                  style: TextStyle(
                    fontFamily: '',
                    fontSize: 25, //HARDCODED
                  ),
                ),
              ],
            ),
          ),
          TaskStatus(
            colorIcon: Colors.purple,
            iconSymbol: Icon(
              Icons.assignment,
              color: Colors.white,
              size: 25,
            ),
            statusname: 'To do',
            numberTasks: '5 Tasks',
          ),
          TaskStatus(
            colorIcon: Colors.orange,
            iconSymbol: Icon(
              Icons.assignment_late,
              color: Colors.white,
              size: 25,
            ),
            statusname: 'In Progress',
            numberTasks: '6 Tasks',
          ),
          TaskStatus(
            colorIcon: Colors.blue[500],
            iconSymbol: Icon(
              Icons.assignment_turned_in,
              color: Colors.white,
              size: 25,
            ),
            statusname: 'Done',
            numberTasks: '25 Tasks',
          ),
        ],
      ),
    );
  }
}
