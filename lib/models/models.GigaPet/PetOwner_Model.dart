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
  late String petName;
  late String petType;
  late String petBreed;
  late String petBirth;

  PetOwnerModel(
    this.email,
    this.fName,
    this.lName,
    this.Username,
    this.uID,
      this.petName,
      this.petType,
      this.petBreed,
      this.petBirth,
      );

  factory PetOwnerModel.fromJson(Map<String, dynamic> data, String personId) {
    final String email = data['email'];
    final String fName = data['fname'];
    final String lName = data['lname'];
    final String Username = data['Username'];
    final String uID = data['uID'];
    final String petName = data['petName'];
    final String petType = data['petType'];
    final String petBreed = data['petBreed'];
    final String petBirth = data['petBirth'];

    return PetOwnerModel(email, fName, lName, Username, uID ,petName,petType,petBreed,petBirth);
  }

  Map<String, dynamic> toMap()
  {
   return {
     'fname': fName,
     'lname': lName,
     'email': email,
     'Username':Username,
     'uID': uID,
     'petName':petName,
     'petType':petType,
     'petBreed':petBreed,
     'petBirth':petBirth,


   };
  }
}