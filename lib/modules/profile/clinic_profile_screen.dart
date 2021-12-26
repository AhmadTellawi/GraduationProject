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

  Database database =  FirestoreDatabase(uid: FirebaseAuth.instance.currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ClinicOwnerModel>(
      stream: database.ClinicOwnerStream(personId: currentUser!.uid),
      builder: (context, snapshot) {
        final person = snapshot.data;
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.deepOrange),
              )
          );
        } else {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepOrange,
                          radius: 28,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              person!.Username,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22
                              ),
                            ),
                            SizedBox(
                              height: 2
                            ),
                        Text(
                          '${person.fName} ${person.lName}',
                          style: TextStyle(
                            fontSize: 14,
                            overflow:TextOverflow.ellipsis,
                             
                          ),
                        ),
                          ],
                        ),
                      ],
                    ),
                      SizedBox(
                      height: 40,
                      ),
                      Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded
                        ),
                        SizedBox(
                          width: 10
                        ),
                        Text(
                          '${person.Address}',
                          style: TextStyle(
                            fontSize: 16,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                    ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded
                        ),
                      SizedBox(
                        width: 10
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Open for business',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'FROM ${person.workHoursFrom} TO ${person.workHoursTo}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ],
                    ),
                    
                    SizedBox(
                      height: 10
                    ),
                    
                    SizedBox(
                      height: 20
                    ),
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
          );
        }
      }
    );
  }
}