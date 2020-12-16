import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Data/dataStructures.dart';
import '../Screens/FullPostScreen.dart';
import '../Screens/ActivityFocusScreen.dart';

enum ICONTYPE { ACTIVITY, LVL, TIME, NM_PEOPLE }

class PreviewPost extends StatefulWidget {
  // This widget is the root of your application.
  final PostData fData;
  PreviewPost({this.fData});

  @override
  _PreviewPostState createState() => _PreviewPostState();
}

class _PreviewPostState extends State<PreviewPost> {
  String expansionTitle = 'More Details';
  List<Widget> activityImages = [];
  int itemsintList = 0;
  Color info=Colors.grey;

  void filLActivityImage() {
    for (int i = 0; i < widget.fData.imagesPath.length; ++i) {
      if (widget.fData.imagesPath[i] == null) {
        widget.fData.imagesPath.removeAt(i);
      } else {
        itemsintList++;
        activityImages.add(
          CircularImage(
            width: 70.0,
            height: 70.0,
            imageURL: widget.fData.imagesPath[i],
          ),
        );
      }
    }
  }

  @override
  void initState() {
    filLActivityImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        child: Column(
          children: [
            Container(
              color: Colors.white,
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
                      '${widget.fData.nickname}',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    subtitle: Text(
                      '@${widget.fData.userName}',
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('${widget.fData.title}',
                          style: TextStyle(color: Colors.black, fontSize: 20))),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.fData.description}',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Container(
                    
                    padding: EdgeInsets.only(left: 10, right: 10,bottom: 10),
                    color: Colors.grey[300],
                    child: ExpansionTile(
                        title: Text(
                          expansionTitle,
                          style: TextStyle(color: Colors.blue),
                        ),
                        leading: Icon(Icons.info,color: info,),
                        onExpansionChanged: (bool a) {
                          setState(() {
                          

                            if (a == false) {
                                info=Colors.grey;
                              expansionTitle = 'More details';
                            } else {
                              info=Colors.orange[800];
                              expansionTitle = 'Less details';
                            }
                          });
                        },
                        children: [
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Activity',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20))),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: activityImages,
                              ),
                              SizedBox(height: 20),
                              Divider(
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Details',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20))),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircularImage(
                                    width: 50.0,
                                    height: 50.0,
                                    imageURL:
                                        'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/lvl.png?alt=media&token=99d1e685-f424-48e7-9eef-db8e7d2284e2',
                                    hasDescription: true,
                                    description: '${widget.fData.lvl}',
                                    fontSize: 15,
                                  ),
                                  SizedBox(width: 15),
                                  CircularImage(
                                    width: 50.0,
                                    height: 50.0,
                                    imageURL:
                                        'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/lvl.png?alt=media&token=99d1e685-f424-48e7-9eef-db8e7d2284e2',
                                    hasDescription: true,
                                    description: '${widget.fData.peopleNum}',
                                    fontSize: 15,
                                  ),
                                  Spacer(),
                                  CircularImage(
                                    width: 50.0,
                                    height: 50.0,
                                    imageURL:
                                        'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/lvl.png?alt=media&token=99d1e685-f424-48e7-9eef-db8e7d2284e2',
                                    hasDescription: true,
                                    description: DateFormat('MM-dd  kk:mm')
                                        .format(DateTime.parse(widget.fData.time
                                            .toDate()
                                            .toString())),
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Divider(
                                color: Colors.grey,
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: RaisedButton(
                                  color: Colors.orange,
                                  child: Text('Request to Join'),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => FullPostScreen(
                    fData: widget.fData,
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
  AddImageActivity({
    this.imagePath,
    this.hasImage = false,
  });

  String get getImage {
    if (hasImage) {
      return imagePath;
    } else
      return null;
  }

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
                  if (value != null) {
                    setState(() {
                      widget.imagePath = value;

                      widget.hasImage = true;
                    });
                  }
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
          width: 70.0,
          height: 70.0,
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
