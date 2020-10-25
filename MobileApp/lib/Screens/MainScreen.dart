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
                              fontFamily: '',
                              fontSize: 15), //HARDCODED
                        ),
                      ],
                    )),
                     SizedBox(height: 15,),
                Expanded(
                  flex: 4,
                  child: Align(alignment: Alignment.topLeft ,child: Text(
                      'lorem ipsume fhjkasfjhnajhfjshnjcnasndjncansjncnajsndj',
                      style: TextStyle(
                        fontFamily: '',
                        fontSize: 15,
                      ),
                     
                      ),
                      )
                    
                ),
                Divider(height: 20),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.timelapse),
                        SizedBox(width:20),
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
    return Container();
  }
}
