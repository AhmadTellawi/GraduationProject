import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class PostModel
{

  late String Username;
  late String petType;
  late String petBreed;
  late String postTopic;
  late String postContent;

  PostModel(
      this.postTopic,
      this.Username,
      this.petType,
      this.petBreed,
      this.postContent,
      );

  PostModel.fromJson(Map<String, dynamic>json,String personId){
    postTopic = json['postTopic'];
    Username = json['username'];
    petType = json['petType'];
    petBreed = json['petBreed'];
    postContent = json['postContent'];


  }
  Map<String, dynamic> toMap()
  {
    return {
      'username': Username,
      'petType': petType,
      'postTopic': postTopic,
      'petBreed':petBreed,
      'postContent': postContent,
    };
  }
}