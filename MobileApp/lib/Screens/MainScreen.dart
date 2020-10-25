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

        padding: EdgeInsets.all(40), //HARDCODED\
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
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
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.orange[600],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpperSegmentBGB extends StatelessWidget {
  //Upper part of the background base(BGB)

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
