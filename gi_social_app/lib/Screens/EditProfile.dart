import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class editProfile extends StatefulWidget {
  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController controllerDescription;
  TextEditingController controllerUser;
  TextEditingController controllerEmail;

  String _descriptionText;
  String _descriptionUser;
  String _descriptionEmail;

  @override
  void initState() {
    controllerDescription = TextEditingController(text: _descriptionText);
    controllerUser = TextEditingController(text: _descriptionUser);
    controllerEmail = TextEditingController(text: _descriptionEmail);
    super.initState();
  }

  @override
  void dispose() {
    controllerDescription.dispose();
    controllerUser.dispose();
    controllerEmail.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(25),
            child: Column(children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 180,
                        height: 50,
                        child: TextField(
                          controller: controllerUser,
                          decoration: InputDecoration(
                            hintText: "ex:Zadoras",
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            labelText: "UserName",
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            fillColor: Colors.grey[200],
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String _) {},
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 180,
                        height: 50,
                        child: TextField(
                          controller: controllerEmail,
                          decoration: InputDecoration(
                            hintText: "ex:example@gmail.com",
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            fillColor: Colors.grey[200],
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String _) {},
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      CircularImage(
                        width: 100,
                        height: 100,
                        imageURL:
                            'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                      ),
                      ButtonTheme(
                        minWidth: 50,
                        height: 10.0,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text("Edit"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextField(
                controller: controllerDescription,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  labelText: "Description",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                maxLines: 8,
                onChanged: (String _) {
                  _descriptionText = controllerDescription.text;
                },
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AddImageActivity(),
                  AddImageActivity(),
                  AddImageActivity(),
                  AddImageActivity(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  RaisedButton(
                    child: Text('Saved'),
                    onPressed: () {},
                  ),
                  Spacer(),
                  RaisedButton(
                    child: Text('Cancel'),
                    onPressed: () {},
                  ),
                ],
              ),
            ])),
      ),
    );
  }
}
