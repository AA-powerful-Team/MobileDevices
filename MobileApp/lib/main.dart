import 'package:flutter/material.dart';

void main() {
  runApp(App());
} //main

//We create the Class App as a StatelessWidget which we override

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter hello world',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}

//Create the home Screen as sama as with the app

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Hello World'),
      ),
      body: Center(
        child: Text('wasap',
            style: TextStyle(
                color: Colors.pink,
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    color: Colors.grey[700],
                    offset: Offset(5, -5),
                  )
                ])),
      ),
    );
  } //widget build

} //HomeScreen
