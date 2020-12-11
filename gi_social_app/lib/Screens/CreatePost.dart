import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController _controllerTitle;
   TextEditingController _controllerDescription;
  String _titleText;
  String _descriptionText;

  @override
  void initState() {
    _controllerTitle = TextEditingController(text: _titleText);
    _controllerDescription = TextEditingController(text: _descriptionText);
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
      appBar: AppBar(),
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
                maxLines: 15,
                controller: _controllerDescription,
                onSubmitted: (String _) {
                  setState(() {
                    _titleText = _controllerDescription.text;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
