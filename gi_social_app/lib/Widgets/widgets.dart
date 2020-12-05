
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Data/dataStructures.dart';
import '../Screens/FullPostScreen.dart';

enum ICONTYPE { ACTIVITY, LVL, TIME, NM_PEOPLE }

class PreviewPost extends StatelessWidget {
  // This widget is the root of your application.
  final PostData data;

  PreviewPost({this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
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
                  '${data.nickname}',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                subtitle: Text(
                  '@${data.userName}',
                  style: TextStyle(color: Colors.blue[600]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('${data.title}',
                      style: TextStyle(color: Colors.black, fontSize: 20))),
              SizedBox(
                height: 10,
              ),
              Text(
                '${data.description}',
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
                    textDesc: data.activity,
                  ),
                  IconicDescription(
                    act: ICONTYPE.LVL,
                    textDesc: '${data.lvl}',
                  ),
                  IconicDescription(
                    act: ICONTYPE.TIME,
                    textDesc: data.time,
                  ),
                  IconicDescription(
                    act: ICONTYPE.NM_PEOPLE,
                    textDesc: '${data.peopleNum}',
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => FullPostScreen(
                    fData: data,
                  )));
        },
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

class CircularImage extends StatelessWidget {

  final double width,height;
  final String imageURL;  

  CircularImage({@required this.width,@required this.height,@required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle, image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageURL),
          )
          ),
    );
  }
}
