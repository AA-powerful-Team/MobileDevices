import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final db = FirebaseFirestore.instance;

  TextEditingController _controllerTitle;
  TextEditingController _controllerDescription;
  TextEditingController _controllerLvl;
  TextEditingController _controllerTime;
  TextEditingController _controllerPeoplNum;
  String _titleText;
  String _descriptionText;
  String lvl;
  String numPeop;
  String time;

  @override
  void initState() {
    _controllerTitle = TextEditingController(text: _titleText);
    _controllerDescription = TextEditingController(text: _descriptionText);
    _controllerLvl = TextEditingController(text: lvl);
    _controllerTime = TextEditingController(text: time);
    _controllerPeoplNum = TextEditingController(text: numPeop);
    super.initState();
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "your Activity title",
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  labelText: "Title",
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                maxLines: 1,
                controller: _controllerTitle,
                onSubmitted: (String _) {
                  setState(() {
                    _titleText = _controllerTitle.text;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
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
                maxLines: 10,
                controller: _controllerDescription,
                onSubmitted: (String _) {
                  setState(() {
                    _titleText = _controllerDescription.text;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.black,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Activity focus',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AddImageActivity(),
                  AddImageActivity(),
                  AddImageActivity(),
                  AddImageActivity(),
                ],
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Lvl activity",
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        labelText: "LvL",
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      controller: _controllerLvl,
                      onSubmitted: (String _) {
                        setState(() {
                          lvl = _controllerLvl.text;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 170,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "ex: 3",
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        labelText: "Num. of Players",
                        labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      controller: _controllerPeoplNum,
                      onSubmitted: (String _) {
                        setState(() {
                          numPeop = _controllerPeoplNum.text;
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "0:00 to 24:00",
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  labelText: "Start time",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(),
                ),
                maxLength: 5,
                controller: _controllerTime,
                onSubmitted: (String _) {
                  setState(() {
                    time = _controllerTime.text;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('Post'),
                color: Colors.orange[800],
                onPressed: () {

                  //To be sure there is content in the textfield I think it should be changed to Textformfield

                  int auxLvl=int.parse(lvl);
                  int auxNumP=int.parse(numPeop);

                  setState(() {
                    db.collection('feed').add({
                      "Activity": _titleText,
                      "ByUser":
                          db.collection('users').doc('Il5ociGM5DEzofBhbdYB'),
                      "Description": _descriptionText,
                      "NumPers": auxNumP,
                      "Time": Timestamp.fromDate(DateTime(2020, 2, 24)),//Change in the future
                      "Title": _titleText,
                      "lvl": auxLvl,
                    });
                    Navigator.of(context).pop();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
