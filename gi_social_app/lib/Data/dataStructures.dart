import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  String nickname;
  String userName;
  String title;
  String description;
  List<dynamic> imagesPath;

  String activity;
  int lvl;
  Timestamp time;
  int peopleNum;
  

  PostData(
      {this.nickname,
      this.userName,
      this.title,
      this.description,
      this.imagesPath,
      this.activity,
      this.lvl,
      this.time,
      this.peopleNum});
}

class UserData {
  String id;
  String nickname;
  String address;
  List friends;
}
