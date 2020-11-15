import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Person {
  final String userID;
  String mail;
  String userName;
  String profilePhotoUrl;
  DateTime createdAt;
  DateTime updatedAt;
  int level;

  Person({@required this.userID, @required this.mail});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'mail': mail,
      'userName': userName,
      'profilePhotoUrl': profilePhotoUrl ?? 'https://firebasestorage.googleapis.com/v0/b/instagram-clone-from-berkan.appspot.com/o/global%2Fno-profile-photo.png?alt=media&token=eeda3d97-c0c7-4f21-ade3-21421959d4a8',
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
      'level': level ?? 1,
    };
  }

  Person.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        mail = map['mail'],
        userName = map['userName'],
        profilePhotoUrl = map['profilePhotoUrl'],
        createdAt = (map['createdAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate(),
        level = map['level'];

  @override
  String toString() {
    return 'UserModel{userID: $userID, mail: $mail, userName: $userName, profilePhotoUrl: $profilePhotoUrl, createdAt: $createdAt, updatedAt: $updatedAt, level: $level}';
  }
}
