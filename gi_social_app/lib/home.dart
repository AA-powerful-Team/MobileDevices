import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Widgets/widgets.dart';
import 'Screens/SettingsScreen.dart';

import 'Data/dataStructures.dart';

class HomeScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    final tabs = [
      HomeTabContent(db: db),
      SettingsScreen(),
    ];

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
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            // backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeTabContent extends StatelessWidget {
  const HomeTabContent({
    Key key,
    @required this.db,
  }) : super(key: key);

  final FirebaseFirestore db;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: db.collection('feed').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final feed = snapshot.data.docs;
          return ListView.builder(
            itemCount: feed.length,
            itemBuilder: (context, index) {
              final post = feed[index];

              var reference =
                  post['ByUser']; //this is the reference to the user collection

              return PreviewPost(
                  data: PostData(
                      nickname:
                          '', // this vars should be fill with data from user collection
                      userName:
                          '', // this vars should be fill with data from user collection
                      title: post['Title'],
                      description: post['Description'],
                      activity: post['Activity'],
                      lvl: post['lvl'],
                      time: post['Time'],
                      peopleNum: post['NumPers']));
            },
          );
        });
  }
}
