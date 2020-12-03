import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Widgets/widgets.dart';
import 'Screens/SettingsScreen.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Genshin Impact Social'),
      ),
     drawer: Drawer(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text('GeoDaddy'),
                accountEmail: Text('iwillhaveorder@liyue.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.mos.cms.futurecdn.net/MN988hPEYu9xwrsQ3uikyT.jpg'),
                ),
              ),
              new ListTile(
                title: Text('Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SettingsScreen()));
                },
              ),
              new Divider(
                color: Colors.black,
                height: 5.0,
              ),
              new ListTile(
                title: Text('low Settings'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SettingsScreen()));
                },
              ),
            ],
          ),
        ),
      body: StreamBuilder(
          stream:
              db.collection('users').doc('Il5ociGM5DEzofBhbdYB').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final user = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('${user['name']}')),
                PreviewPost(),
              ],
            );
          }),
    );
  }
}
