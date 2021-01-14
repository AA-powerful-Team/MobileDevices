import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class ProfileData {
  String name;
  String adress;
  String description;

  ProfileData(
      {this.name = 'Username',
      this.adress = 'Email',
      this.description = 'Description'});
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController controllerDescription;
  TextEditingController controllerUser;
  TextEditingController controllerEmail;

  String _descriptionText;
  String _descriptionUser;
  String _descriptionEmail;

  ProfileData editProfData;

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
      appBar: AppBar(
        title: Text('Edit profile'),
      ),
      body: Container(
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
                        onChanged: (String _) {
                          _descriptionUser = controllerUser.text;
                        },
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
                        onChanged: (String _) {
                          _descriptionEmail = controllerEmail.text;
                        },
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
                  onPressed: () {
                    setState(() {
                      editProfData.description = _descriptionText;
                      editProfData.adress = _descriptionEmail;
                      editProfData.name = _descriptionUser;
                    });
                    Navigator.of(context).pop(editProfData);
                  },
                ),
                Spacer(),
                RaisedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(null);
                  },
                ),
              ],
            ),
          ])),
    );
  }
}

class ProfileInfo extends StatefulWidget {
  ProfileData data = new ProfileData();

  @override
  _ProfileInfo createState() => _ProfileInfo();
}

class _ProfileInfo extends State<ProfileInfo> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(right: 25, left: 25, bottom: 10, top: 40),
          child: Column(children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 180,
                      height: 50,
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          labelText: widget.data.name,
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
                        enabled: false,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          labelText: widget.data.adress,
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
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            TextField(
              enabled: false,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey[800]),
                labelText: widget.data.description,
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(),
              ),
              maxLines: 8,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularImage(
                  width: 50,
                  height: 50,
                  imageURL:
                      'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/plus-flat.png?alt=media&token=105bb482-ca42-48a3-82ff-b3651b725e5c',
                ),
                CircularImage(
                  width: 50,
                  height: 50,
                  imageURL:
                      'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/plus-flat.png?alt=media&token=105bb482-ca42-48a3-82ff-b3651b725e5c',
                ),
                CircularImage(
                  width: 50,
                  height: 50,
                  imageURL:
                      'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/plus-flat.png?alt=media&token=105bb482-ca42-48a3-82ff-b3651b725e5c',
                ),
                CircularImage(
                  width: 50,
                  height: 50,
                  imageURL:
                      'https://firebasestorage.googleapis.com/v0/b/gi-social-app.appspot.com/o/plus-flat.png?alt=media&token=105bb482-ca42-48a3-82ff-b3651b725e5c',
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            RaisedButton(
              child: Text('Edit Profile'),
              color: Colors.orange,
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      widget.data.name = value.name;
                      widget.data.adress = value.adress;
                      widget.data.description = value.description;
                    });
                  }
                });
              },
            )
          ])),
    );
  }
}
