import 'package:flutter/material.dart';

class PreviewPost extends StatelessWidget {
  // This widget is the root of your application.
  Icon userAvatar;
  String nickname = 'Nickname';
  String userName = 'User name';
  String title = 'title';
  String description =
      'hola que tal me gustaria ir a hcer unos bosses bien calentittos para conseguir materiales par xiangling';
  List<Icon> descriptionIcons;
  Image descriptionPic;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 275,
        width: 375,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: Icon(
                      Icons.person,
                      size: 40,
                    )),
                SizedBox(width: 15),
                Column(
                  children: [
                    Text(
                      '$nickname',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      '@$userName',
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('TITLE', style: TextStyle(color: Colors.black))),
            SizedBox(
              height: 10,
            ),
            Text(
              '$description',
              style: TextStyle(color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          
          ],
        ),
      ),
    );
  }
}
