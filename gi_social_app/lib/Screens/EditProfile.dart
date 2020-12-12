import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController controllerDescription;
  String _descriptionText = 'description';

  @override
  void initState() {
    controllerDescription = TextEditingController(text: _descriptionText);
    super.initState();
  }

  @override
  void dispose() {
    controllerDescription.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text('Edit Profile',
                style: TextStyle(fontSize: 50, color: Colors.white))),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //profile email, user and pic
          children: [
            Container(
              height: 300,
              width: 200,
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
                          style: TextStyle(fontSize: 25, color: Colors.black)),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text('edit',
                          style: TextStyle(fontSize: 25, color: Colors.white))),
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
                          style: TextStyle(fontSize: 25, color: Colors.black)),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text('edit',
                          style: TextStyle(fontSize: 25, color: Colors.white))),
                ],
              ),
            ),
            Column(//profile pic
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
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Description')),
                Container(
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: controllerDescription,
                    onSubmitted: (String _) {
                      setState(() {
                        _descriptionText = controllerDescription.text;
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ), // description
        Row(
          children: [
            Column(
              children: [
                Text('characters'),
                Container(
                  color: Colors.white,
                ),
                Row(
                  children: [
                    AddImageActivity(),
                    AddImageActivity(),
                    AddImageActivity(),
                    AddImageActivity(),
                  ],
                )
              ],
            )
          ],
        ),
        //group info
        Row() //buttons cancel confirm
      ],
    );
  }
}
