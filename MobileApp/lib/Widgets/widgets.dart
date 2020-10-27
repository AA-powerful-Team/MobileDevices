import 'package:flutter/material.dart';

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
                  style: TextStyle(fontFamily: '', fontSize: 30),
                ),
                SizedBox(height: 10),
                Text(
                  '$rol',
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
 final String numberTasks;

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
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
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
              fontFamily: '',
              fontSize: 25, 
            ),
          ),
          Spacer(),
          Text(
            '$numberTasks', 
            style: TextStyle(
              fontFamily: '',
              fontSize: 15, 
            ),
          ),
        ],
      ),
    );
  }
}

class TaskInformation extends StatelessWidget {

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
