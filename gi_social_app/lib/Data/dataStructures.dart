import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  String nickname;
  String userName;
  String title;
  String description;

  String activity;
  int lvl;
  Timestamp time;
  int peopleNum;

  PostData(
      {this.nickname,
      this.userName,
      this.title,
      this.description,
      this.activity,
      this.lvl,
      this.time,
      this.peopleNum});
}

class UserData {
  int id;
  String nickname;
  String address;
}
