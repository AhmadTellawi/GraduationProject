import 'package:flutter/material.dart';
import 'package:gigapet/modules/profile/owner_profile_screen.dart';
import 'package:gigapet/shared/components/components.dart';

class PetOwnerEditProfileScreen extends StatefulWidget {
  const PetOwnerEditProfileScreen({ Key? key }) : super(key: key);

  @override
  _PetOwnerEditProfileScreenState createState() => _PetOwnerEditProfileScreenState();
}

class _PetOwnerEditProfileScreenState extends State<PetOwnerEditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
              defaultFormField(
                label: 'First Name', 
              ),
              SizedBox(
                height: 20,
              ),
              defaultFormField(
                label: 'Last Name', 
              ),
              SizedBox(
                height: 20,
              ),
              defaultFormField(
                label: 'username', 
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepOrange,
                    radius: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  defaultFormField(label: 'Pet Name'),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(label: 'Pet Type'),
                      SizedBox(
                    height: 20,
                  ),
                  defaultFormField(label: 'Pet Breed'),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    label: 'Date of Birth',
                    onTap: (){
                      showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(), 
                        firstDate: DateTime.now(), 
                        lastDate: DateTime.now()
                      );
                    }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: 'CONFIRM',
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        )
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}