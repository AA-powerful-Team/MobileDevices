import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Data/dataStructures.dart';
import '../Widgets/widgets.dart';

class FullPostScreen extends StatefulWidget {
  final PostData fData;
  FullPostScreen({@required this.fData});

  @override
  _FullPostScreenState createState() => _FullPostScreenState();
}

class _FullPostScreenState extends State<FullPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Activity',
                        style: TextStyle(color: Colors.black, fontSize: 20))),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularImage(
                      width: 90.0,
                      height: 90.0,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/Assets%2FImages%2FBosses%2FAndrius.png?alt=media&token=1794595c-2ad3-4cc8-a30d-5925449aa1f2',
                    ),
                    CircularImage(
                      width: 90.0,
                      height: 90.0,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/Assets%2FImages%2FBosses%2FAndrius.png?alt=media&token=1794595c-2ad3-4cc8-a30d-5925449aa1f2',
                    ),
                    CircularImage(
                      width: 90.0,
                      height: 90.0,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/Assets%2FImages%2FBosses%2FAndrius.png?alt=media&token=1794595c-2ad3-4cc8-a30d-5925449aa1f2',
                    )
                  ],
                ),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Details',
                        style: TextStyle(color: Colors.black, fontSize: 20))),
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
                    SizedBox(width:15),
                    CircularImage(
                      width: 50.0,
                      height: 50.0,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/lvl.png?alt=media&token=99d1e685-f424-48e7-9eef-db8e7d2284e2',
                      hasDescription: true,
                      description:  DateFormat('MM-dd  kk:mm').format(DateTime.parse(widget.fData.time.toDate().toString())),
                        fontSize: 15,
                    ),
                      SizedBox(width:15),
                    CircularImage(
                      width: 50.0,
                      height: 50.0,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/lvl.png?alt=media&token=99d1e685-f424-48e7-9eef-db8e7d2284e2',
                      hasDescription: true,
                      description: '${widget.fData.peopleNum}',
                      fontSize: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
