import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Data/dataStructures.dart';
import '../Screens/FullPostScreen.dart';
import '../Screens/ActivityFocusScreen.dart';

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
                    textDesc: DateFormat('MM-dd  kk:mm')
                        .format(DateTime.parse(data.time.toDate().toString())),
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

class AddImageActivity extends StatefulWidget {
  String imagePath;
  bool hasImage;
  AddImageActivity({this.imagePath, this.hasImage = false});

  @override
  _AddImageActivityState createState() => _AddImageActivityState();
}

class _AddImageActivityState extends State<AddImageActivity> {
  @override
  Widget build(BuildContext context) {
    if (widget.hasImage == false) {
      return Material(
        color: Colors.white,
        child: Center(
          child: Ink(
            decoration: const ShapeDecoration(
              color: Colors.grey,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => ActivityFocusScreen()))
                    .then((value) {
                  setState(() {
                    widget.imagePath = value;
                    widget.hasImage = true;
                  });
                });
              },
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onLongPress: () {
          setState(() {

            widget.hasImage = false;
            widget.imagePath = null;
          });
        },
        child: CircularImage(
          width: 90.0,
          height: 90.0,
          imageURL: widget.imagePath,
        ),
      );
    }
  }
}

class CircularImage extends StatelessWidget {
  final double width, height;
  final String imageURL;

  final bool hasDescription;
  final String description;
  final double fontSize;
  CircularImage(
      {@required this.width,
      @required this.height,
      @required this.imageURL,
      this.hasDescription = false,
      this.description,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    if (!hasDescription) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imageURL),
            )),
      );
    } else {
      return Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageURL),
                )),
          ),
          //   SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(fontSize: fontSize, color: Colors.black),
          )
        ],
      );
    }
  }
}
