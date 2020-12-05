import 'package:flutter/material.dart';
import '../Data/dataStructures.dart';

class FullPostScreen extends StatefulWidget {
  
  PostData fData;
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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
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
