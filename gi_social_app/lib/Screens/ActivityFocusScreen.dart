import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityFocusScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: db.collection('assets').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final listdata = snapshot.data.docs;
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemCount: listdata.length,
            itemBuilder: (context, index) {
              final list = listdata[index];
              final urlString = list['Image'];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(urlString);
                },
                child: Image.network(urlString),
              );
            },
          );
        },
      ),
    );
  }
}
