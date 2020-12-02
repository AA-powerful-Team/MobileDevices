import 'package:flutter/material.dart';

class PreviewPost extends StatelessWidget {
  // This widget is the root of your application.
  Icon userAvatar;
  String userName = 'User name';
  List<Icon> descriptionIcons;
  Image descriptionPic;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Container(
        padding: EdgeInsets.all(20),
        height: 275,
        width: 350,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                    
                      shape: BoxShape.circle

                    ),
                    child: Icon(
                      Icons.person,
                      size: 30,
                    )),
                Text('$userName'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
