import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gigapet/database/database.dart';
import 'package:gigapet/models/models.GigaPet/PetOwner_Model.dart';
import 'package:gigapet/modules/profile/edit_owner_profile_screen.dart';
import 'package:gigapet/shared/components/components.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({ Key? key }) : super(key: key);

   User? currentUser=FirebaseAuth.instance.currentUser;
   Database database=new FirestoreDatabase(uid: FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PetOwnerModel>(
      stream: database.personStream(personId: currentUser!.uid),
      builder: (context, snapshot) {
        PetOwnerModel? person=snapshot.data;
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepOrange,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${person!.fName} ${person.lName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  Text(
                    'username'
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
                              'Pet Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
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
                              'Type: ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Breed: ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Date of Birth: ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
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
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PetOwnerEditProfileScreen(),
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
    );
  }


}