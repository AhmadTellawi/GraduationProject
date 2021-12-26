import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gigapet/database/database.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/models/models.GigaPet/PetOwner_Model.dart';
import 'package:gigapet/modules/profile/edit_owner_profile_screen.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';
import 'package:gigapet/shared/components/components.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

   Database database =  FirestoreDatabase(uid: FirebaseAuth.instance.currentUser!.uid) ;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PetOwnerModel>(
        stream: database.PetOwnerStream(personId: currentUser!.uid),
        builder: (context, snapshot) {
          final person = snapshot.data;
          if (!snapshot.hasData)
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.purple),
            ));
          else
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.deepOrange,
                            radius: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${person!.fName} ${person.lName}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            '${person.Username}'
                          ),
                        ],
                      ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.deepOrange,
                                  radius: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  '${person.petName}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${person.petType}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${person.petBreed}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${person.petBirth}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      defaultButton(
                        text: 'EDIT PROFILE',
                        color: Colors.green,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PetOwnerEditProfileScreen(),
                              ));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                        color: Colors.red,
                        text: 'DELETE PROFILE',
                        onPressed: () {
                          currentUser!.delete();
                            Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute
                              (builder: (context) => SignInScreen(),
                            )
                            );
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
        });
  }
}
