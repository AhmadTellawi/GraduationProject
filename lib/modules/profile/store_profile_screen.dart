import 'package:flutter/material.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/modules/profile/edit_owner_profile_screen.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';
import 'package:gigapet/shared/components/components.dart';

class StoreProfileScreen extends StatelessWidget {
  const StoreProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('THIS IS FOR THE STORE'),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'FIrst Name Last Name',
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
                Container(
                  color: Colors.grey[350],
                  height: 400,
                  child: Padding(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}