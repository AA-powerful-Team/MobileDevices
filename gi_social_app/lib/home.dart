import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Widgets/widgets.dart';
import 'Screens/SettingsScreen.dart';

import 'Data/dataStructures.dart';

final db = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomeTabContent(),
      SettingsScreen(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {


         
          Timestamp testTime=Timestamp.now();
          setState(() {
            
            
            db.collection('feed').add({

              "Activity":"MaterialFarming",
              "ByUser": db.collection('users').doc('Il5ociGM5DEzofBhbdYB'),
              "Decription":"Want to farm some materials to increase character talents",
              "NumPers": 2,
              "Time":Timestamp.fromDate(DateTime(2020,2,24)),
              "Title":"Farming",
              "lvl":50,

            });



          });

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber[800],
      ),
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

class HomeTabContent extends StatefulWidget {
  @override
  _HomeTabContentState createState() => _HomeTabContentState();
}

class _HomeTabContentState extends State<HomeTabContent> {
  //dynamic data;

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

              DocumentReference ref=post['ByUser'];
              String idDoc=ref.path.substring(6);
              var refDoc = db.collection('users').doc('$idDoc').get();

             return Container(
               child: FutureBuilder(
                  future: refDoc,
                  builder: (context2, snapshot2) {
                    if (snapshot2.connectionState == ConnectionState.done) {
                      var a=snapshot2.data;
                     
                      return PreviewPost(
                          data: PostData(
                              // this vars should be fill with data from user collection
                              nickname: //CRASH HERE
                               a['Nickname'], // this vars should be fill with data from user collection
                              title: post['Title'],
                              description: post['Description'],
                              activity: post['Activity'],
                              lvl: post['lvl'],
                              time: post['Time'],
                              peopleNum: post['NumPers']));
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
             );
            },
          );
        });
  }
}
