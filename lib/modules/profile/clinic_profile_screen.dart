import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gigapet/database/database.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/models/models.GigaPet/Clinic_Model.dart';
import 'package:gigapet/modules/profile/edit_owner_profile_screen.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';
import 'package:gigapet/shared/components/components.dart';

import 'edit_clinic_profile_screen.dart';

class ClinicProfileScreen extends StatefulWidget {
   ClinicProfileScreen({ Key? key }) : super(key: key);



  @override
  State<ClinicProfileScreen> createState() => _ClinicProfileScreenState();
}

class _ClinicProfileScreenState extends State<ClinicProfileScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  Database database =  FirestoreDatabase(uid: FirebaseAuth.instance.currentUser!.uid) ;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ClinicOwnerModel>(
      stream: database.ClinicOwnerStream(personId: currentUser!.uid),
      builder: (context, snapshot) {
        final person = snapshot.data;
        if (!snapshot.hasData)
          return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.purple),
              ));
        else
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('THIS IS FOR THE CLINIC'),
                    CircleAvatar(
                      backgroundColor: Colors.deepOrange,
                      radius: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${person!.Username}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      '${person.fName} ${person.lName}'
                    ),
                      SizedBox(
                      height: 20,
                    ),
                    Row(
                    children: [
                      Icon(
                    Icons.access_time_filled_rounded
                      ),
                      SizedBox(width: 10,),
                      Text(
                    'Open for business from 00:00 AM to 00:00 PM'
                      ),
                    ],
                    ),
                    SizedBox(
                    height: 20,
                    ),
                    Row(
                    children: [
                      Icon(
                    Icons.location_on_rounded
                      ),
                      SizedBox(width: 10,),
                      Text(
                    'Address: something, somewhere'
                      ),
                    ],
                    ),
                    SizedBox(height: 20,),
                    defaultButton(
                      text: 'EDIT PROFILE',
                      color: Colors.green,
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClinicEditProfileScreen(),
                          )
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                      color: Colors.red,
                      text: 'DELETE PROFILE',
                      onPressed: (){},
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}