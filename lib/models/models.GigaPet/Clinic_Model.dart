import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

class ClinicOwnerModel
{

  late String fName;
  late String lName;
  late String Username;
  late String email;
  late String uID;
  late String workHoursFrom;
  late String workHoursTo;
  late String Address;

  ClinicOwnerModel(
      this.email,
      this.fName,
      this.lName,
      this.Username,
      this.uID,
      this.workHoursFrom,
      this.workHoursTo,
      this.Address,

      );

  ClinicOwnerModel.fromJson(Map<String, dynamic>json){
    email = json['email'];
    fName = json['fName'];
    lName = json['lName'];
    Username = json['username'];
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