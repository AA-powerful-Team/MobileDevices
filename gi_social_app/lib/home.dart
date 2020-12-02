import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Genshin Impact Social'),
      ),
      body: StreamBuilder(
          stream:
              db.collection('users').doc('Il5ociGM5DEzofBhbdYB').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
          final user=snapshot.data; 
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('${user['name']}')),
              ],
            );
          }),
    );
  }
}
