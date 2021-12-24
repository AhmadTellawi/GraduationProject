import 'package:flutter/material.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/modules/profile/edit_owner_profile_screen.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';
import 'package:gigapet/shared/components/components.dart';

import 'edit_clinic_profile_screen.dart';

class ClinicProfileScreen extends StatelessWidget {
   ClinicProfileScreen({ Key? key }) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
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
                  'Username',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  'FIrst Name Last Name'
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
}