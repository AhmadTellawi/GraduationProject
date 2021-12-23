import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PetOwnerModel
{

  late String fName;
  late String lName;
  late String Username;
  late String email;
  late String uID;

  PetOwnerModel(
    this.email,
    this.fName,
    this.lName,
    this.Username,
    this.uID,
      );

  PetOwnerModel.fromJson(Map<String, dynamic>json){
  email = json['email'];
  fName = json['fName'];
  lName = json['lName'];
  Username = json['username'];
  uID = json['uID'];
  }


  Map<String, dynamic> toMap()
  {
   return {
     'fname': fName,
     'lname': lName,
     'email': email,
     'Username':Username,
     'uID': uID,
   };
  }
}