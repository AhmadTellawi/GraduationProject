import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PetOwnerModel {
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

  factory PetOwnerModel.fromMap(Map<String, dynamic> data, String personId) {
    final String email = data['email'];
    final String fName = data['fName'];
    final String lName = data['lName'];
    final String Username = data['Username'];
    final String uID = data['uID'];

    return PetOwnerModel(email, fName, lName, Username, uID);
  }

  Map<String, dynamic> toMap() {
    return {
      'fname': fName,
      'lname': lName,
      'email': email,
      'Username': Username,
      'uID': uID,
    };
  }
}
