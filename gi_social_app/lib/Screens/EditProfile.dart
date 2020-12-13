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

  String _descriptionText = 'description';
  String _descriptionUser = 'Username';
  String _descriptionEmail = 'Email';

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
    return Container(
      child: Container(
        padding: EdgeInsets.only(right: 15, left: 15),
        child: Column(
          children: [
            Center(
                child: Text('Edit Profile',
                    style: TextStyle(fontSize: 50, color: Colors.white))),

            Container(
              //padding:
              //    EdgeInsets.only(right: 10, left: 10, bottom: 30, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //profile email, user and pic
                children: [
                  Column(
                    //email and user
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: TextField(
                          controller: controllerUser,
                          onSubmitted: (String _) {
                            setState(() {
                              _descriptionUser = controllerUser.text;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        height: 30,
                        width: 150,
                        padding: EdgeInsets.only(right: 5, left: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: TextField(
                          controller: controllerEmail,
                          onSubmitted: (String _) {
                            setState(() {
                              _descriptionEmail = controllerEmail.text;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
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
            ),
            Text('About you',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Row(
              children: [
                Container(
                  width: 340,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: controllerDescription,
                        decoration: InputDecoration(
                          hintText: "your description",
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          labelText: "Description",
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 8,
                        onSubmitted: (String _) {
                          setState(() {
                            _descriptionText = controllerDescription.text;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ), // description

            Text('Characters',
                style: TextStyle(fontSize: 20, color: Colors.white)),
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
            ),

            //group info
            Row(
              children: [
                RaisedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    //Navigator.of(context).pop();
                  },
                ),
                Spacer(),
                RaisedButton(
                  child: Text('Confirm'),
                  onPressed: () {
                    //update values in firebase
                    //Navigator.of(context).pop();
                  },
                )
              ],
            ) //buttons cancel confirm
          ],
        ),
      ),
    );
  }
}
