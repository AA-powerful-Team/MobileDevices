import 'package:flutter/material.dart';

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
              child: TaskInformation(),
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

class TaskInformation extends StatelessWidget {
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
                          'Task name', //HARDCODED
                          style: TextStyle(
                            fontFamily: '',
                            fontSize: 25, //HARDCODED
                          ),
                        ),
                        SizedBox(width: 150), //HARDCODED
                        Spacer(),
                        Text(
                          'priority',
                          style: TextStyle(
                              fontFamily: '', fontSize: 15), //HARDCODED
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
                        'lorem ipsume fhjkasfjhnajhfjshnjcnasndjncansjncnajsndj',
                        style: TextStyle(
                          fontFamily: '',
                          fontSize: 15,
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
                        Text('xx/xx/xxxx'),
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
            child: UserInfo(),
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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(45))),
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
          Expanded(
            // to do 5 tasks
            flex: 1,
            child: Row(
              children: [
                Container(
                  // color square
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  child: Container(
                    // icon inside the square
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      // icon inside square
                      Icons.assignment,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'To do', //HARDCODED
                  style: TextStyle(
                    fontFamily: '',
                    fontSize: 25, //HARDCODED
                  ),
                ),
                Spacer(),
                Text(
                  '5 tasks', //HARDCODED
                  style: TextStyle(
                    fontFamily: '',
                    fontSize: 15, //HARDCODED
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // In Progress 6 tasks
            flex: 1,
            child: Row(
              children: [
                Container(
                  // color square
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  child: Container(
                    // icon inside the square
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      // icon inside square
                      Icons.assignment_late,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'In Progress', //HARDCODED
                  style: TextStyle(
                    fontFamily: '',
                    fontSize: 25, //HARDCODED
                  ),
                ),
                Spacer(),
                Text(
                  '6 tasks', //HARDCODED
                  style: TextStyle(
                    fontFamily: '',
                    fontSize: 15, //HARDCODED
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // done 25 tasks
            flex: 1,
            child: Row(
              children: [
                Container(
                  // color square
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                  child: Container(
                    // icon inside the square
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      // icon inside square
                      Icons.assignment_turned_in,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Done', //HARDCODED
                  style: TextStyle(
                    fontFamily: '',
                    fontSize: 25, //HARDCODED
                  ),
                ),
                Spacer(),
                Text(
                  '25 tasks', //HARDCODED
                  style: TextStyle(
                    fontFamily: '',
                    fontSize: 15, //HARDCODED
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  'Jane Cooper',
                  style: TextStyle(fontFamily: '', fontSize: 30),
                ),
                SizedBox(height: 10),
                Text(
                  'Project manager',
                  style: TextStyle(fontFamily: '', fontSize: 20),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset('assets/Devicesavatar.png'),
            ),
          ),
        ],
      ),
    );
  }
}
