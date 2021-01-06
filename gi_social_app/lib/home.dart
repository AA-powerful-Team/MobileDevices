import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gi_social_app/Screens/CreatePost.dart';
import 'Widgets/widgets.dart';
import 'Screens/SettingsScreen.dart';
import 'Screens/EditProfile.dart';
import 'Data/dataStructures.dart';

import 'package:intl/intl.dart';

final db = FirebaseFirestore.instance;
UserData thisUser;

class HomeScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HomeTabContent(),
      RemindersTabContent(),
      FriendsTabContent(),
      ProfileInfo(),
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => CreatePost()));
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
            icon: Icon(Icons.timelapse),
            label: 'Reminders',
            // backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
            // backgroundColor: Colors.black,
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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

              DocumentReference ref = post['ByUser'];
              String idDoc = ref.id;
              var refDoc = db.collection('users').doc('$idDoc').get();

              return Container(
                child: FutureBuilder(
                  future: refDoc,
                  builder: (context2, snapshot2) {
                    if (snapshot2.connectionState == ConnectionState.done) {
                      var a = snapshot2.data;

                      return PreviewPost(
                          fData: PostData(
                              // this vars should be fill with data from user collection
                              nickname: //CRASH HERE
                                  a['Nickname'],
                              userName: a[
                                  'UserName'], // this vars should be fill with data from user collection
                              title: post['Title'],
                              description: post['Description'],
                              activity: post['Activity'],
                              imagesPath: post['ActvityImages'],
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

class FriendsTabContent extends StatefulWidget {
  @override
  _FriendsTabContentState createState() => _FriendsTabContentState();
}

class _FriendsTabContentState extends State<FriendsTabContent> {
  @override
  Widget build(BuildContext context) {
    // thisUser.id = "Il5ociGM5DEzofBhbdYB";
    var thisUser = db.collection('users').doc('Il5ociGM5DEzofBhbdYB').get();

    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: thisUser,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            var aux = snap.data;
            List friendsList = aux['Friends'];
            return ListView.builder(
              itemCount: friendsList.length,
              itemBuilder: (context, index) {
                DocumentReference ref = friendsList[index];

                String idDoc = ref.id;
                var refDoc = db.collection('users').doc('$idDoc').get();
                return FutureBuilder(
                    future: refDoc,
                    builder: (context2, snap2) {
                      if (snap2.connectionState == ConnectionState.done) {
                        var data = snap2.data;
                        return ListTile(
                          tileColor: Colors.grey[100],
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(data['PicProfile']),
                          ),
                          title: Text(data['Nickname']),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.filter_tilt_shift,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        );
                      } else
                        return CircularProgressIndicator();
                    });
              },
            );
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}

class RemindersTabContent extends StatefulWidget {
  @override
  _RemindersTabContentState createState() => _RemindersTabContentState();
}

class _RemindersTabContentState extends State<RemindersTabContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: StreamBuilder(
        stream: db
            .collection('users')
            .doc('Il5ociGM5DEzofBhbdYB')
            .collection('Reminders')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snap) {
          if (!snap.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final remdata = snap.data.docs;

          return ListView.builder(
            itemCount: remdata.length,
            itemBuilder: (context2, index) {
              final rem = remdata[index];
              DocumentReference ref = rem['RemByUser'];
              String refID = ref.id;
              return FutureBuilder(
                future: db.collection('users').doc(refID).get(),
                builder: (context, fut) {
                  if (fut.connectionState == ConnectionState.done) {
                    final uDataAux = fut.data;

                    Timestamp date = rem['Date'];
                    
                    return ListTile(
                      tileColor: Colors.grey[100],
                      leading: Icon(
                        Icons.notification_important,
                        color: Colors.red,
                      ),
                      title: Text('You have an activity with:'),
                      subtitle: Text(
                        uDataAux['Nickname'],
                        style: TextStyle(color: Colors.blue),
                      ),
                      trailing: Text(DateFormat('MM-dd  kk:mm')
                          .format(DateTime.parse(date.toDate().toString())),style: TextStyle(color: Colors.black),),
                    );
                  } else
                    return CircularProgressIndicator();
                },
              );
            },
          );
        },
      ),
    );
  }
}
