import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gigapet/database/database.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/models/models.GigaPet/Store_model.dart';
import 'package:gigapet/modules/profile/clinic_profile_screen.dart';
import 'package:gigapet/modules/profile/edit_owner_profile_screen.dart';
import 'package:gigapet/modules/profile/edit_store_profile_screen.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';
import 'package:gigapet/shared/components/components.dart';
import 'package:gigapet/store_sign_in/sign_in_screen.dart';

class StoreProfileScreen extends StatefulWidget {
  const StoreProfileScreen({ Key? key }) : super(key: key);

  @override
  State<StoreProfileScreen> createState() => _StoreProfileScreenState();
}

class _StoreProfileScreenState extends State<StoreProfileScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  Database database =  FirestoreDatabase(uid: FirebaseAuth.instance.currentUser!.uid) ;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StoreOwnerModel>(
      stream: database.StoreOwnerStream(personId: currentUser!.uid),
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
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
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
                              children: [
                                Text(
                                  person!.Username,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                  ),
                                ),
                                SizedBox(
                                  height: 8
                                ),
                            Text(
                              '${person.fName} ${person.lName}'
                            ),
                              ],
                            ),
                          ],
                        ),
                          SizedBox(
                          height: 50,
                          ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled_rounded
                            ),
                          SizedBox(
                            width: 10
                          ),
                          Text(
                            'Open for business from ${person.workHoursFrom} AM'
                          ),
                        ],
                        ),
                        Text(
                          '          to ${person.workHoursTo} PM'
                        ),
                        SizedBox(
                          height: 20
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
                              'Address: ${person.Address}'
                            ),
                        ],
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
                                builder: (context) => StoreEditProfileScreen(),
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
                          onPressed: (){
                            currentUser!.delete();
                            Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute
                              (builder: (context) => StoreSignInScreen(),
                            )
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  ),
                ),
        );
        }
      }
    );
  }
}