import 'package:flutter/material.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text('Edit Profile',
                style: TextStyle(fontSize: 50, color: Colors.white))),
        Expanded(
          flex: 3,
          child: Row(
            //profile email, user and pic
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      EdgeInsets.only(right: 10, left: 10, bottom: 30, top: 30),
                  child: Column(
                    //email and user
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(right: 5, left: 5),
                          alignment: Alignment.centerLeft,
                          child: Text('Email',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black)),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Text('edit',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.white))),
                      Spacer(flex: 1),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(right: 5, left: 5),
                          alignment: Alignment.centerLeft,
                          child: Text('Username',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black)),
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Text('edit',
                              style: TextStyle(
                                  fontSize: 25, color: Colors.white))),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(//profile pic
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text('edit',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ]),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Column(
                children: [
                  Text('description'),
                  Container(
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ), // description
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Column(
                children: [
                  Text('characters'),
                  Container(
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ), //group info
        Row() //buttons cancel confirm
      ],
    );
  }
}
