import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class StoreOwnerModel
{

  late String fName;
  late String lName;
  late String Username;
  late String email;
  late String uID;
  late String workHoursFrom;
  late String workHoursTo;
  late String Address;

  StoreOwnerModel(
      this.email,
      this.fName,
      this.lName,
      this.Username,
      this.uID,
      this.workHoursFrom,
      this.workHoursTo,
      this.Address,

      );

  StoreOwnerModel.fromJson(Map<String, dynamic>json){
    email = json['email'];
    fName = json['fname'];
    lName = json['lname'];
    Username = json['Username'];
    uID = json['uID'];
    workHoursFrom = json['workHoursFrom'];
    workHoursTo = json['workHoursTo'];
    Address = json['Address'];

  }


  Map<String, dynamic> toMap()
  {
    return {
      'fname': fName,
      'lname': lName,
      'email': email,
      'Username':Username,
      'uID': uID,
      'workHoursFrom': workHoursFrom,
      'workHoursTo': workHoursTo,
      'Address': Address,
    };
  }
}