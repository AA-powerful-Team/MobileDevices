import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ICONTYPE { ACTIVITY, LVL, TIME, NM_PEOPLE }

class PreviewPost extends StatelessWidget {
  // This widget is the root of your application.

  String nickname;
  String userName;
  String title;
  String description;

  String activity;
  String lvl;
  String time;
  String peopleNum;

  PreviewPost({this.nickname, this.userName, this.title, this.description,this.activity,this.lvl,this.time,this.peopleNum});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(20),
        width: 375,
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
              ),
              title: Text(
                '$nickname',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: Text(
                '@$userName',
                style: TextStyle(color: Colors.blue[600]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('$title', style: TextStyle(color: Colors.black,fontSize: 20))),
            SizedBox(
              height: 10,
            ),
            Text(
              '$description',
              style: TextStyle(color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconicDescription(
                  act: ICONTYPE.ACTIVITY,
                  textDesc: activity,
                ),
                IconicDescription(
                  act: ICONTYPE.LVL,
                  textDesc: lvl,
                ),
                IconicDescription(
                  act: ICONTYPE.TIME,
                  textDesc: time,
                ),
                IconicDescription(
                  act: ICONTYPE.NM_PEOPLE,
                  textDesc: peopleNum,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconicDescription extends StatelessWidget {
  // This widget is the root of your application.

  ICONTYPE act;
  String textDesc;
  Icon iconDesc;

  IconicDescription({@required this.act, @required this.textDesc});

  @override
  Widget build(BuildContext context) {
    switch (act) {
      case ICONTYPE.ACTIVITY:
        iconDesc = Icon(
          Icons.person,
          color: Colors.grey,
        );
        break;
      case ICONTYPE.LVL:
        iconDesc = Icon(Icons.confirmation_number, color: Colors.grey);
        break;
      case ICONTYPE.TIME:
        iconDesc = Icon(Icons.timelapse, color: Colors.grey);
        break;
      case ICONTYPE.NM_PEOPLE:
        iconDesc = Icon(Icons.person_add, color: Colors.grey);
        break;
    }

    return Column(
      children: [
        iconDesc,
        Text(
          '$textDesc',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
