import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gigapet/anonymous_layout/clinic_layout/layout/gigapet/clinic_layout.dart';
import 'package:gigapet/database/database.dart';

import 'package:gigapet/models/models.GigaPet/Clinic_Model.dart';
import 'package:gigapet/modules/profile/clinic_profile_screen.dart';
import 'package:gigapet/shared/components/components.dart';

class ClinicEditProfileScreen extends StatefulWidget {
  ClinicEditProfileScreen({ Key? key }) : super(key: key);

  @override
  State<ClinicEditProfileScreen> createState() => _ClinicEditProfileScreenState();
}

class _ClinicEditProfileScreenState extends State<ClinicEditProfileScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  Database database =  FirestoreDatabase(uid: FirebaseAuth.instance.currentUser!.uid) ;

  var fNameController = TextEditingController();

  var lNameController = TextEditingController();

  var userNameController = TextEditingController();

  var clinicWorkHoursFromController = TextEditingController();

  var clinicWorkHoursToController = TextEditingController();

  var clinicAddressController = TextEditingController();

  var formKey = GlobalKey<FormState>();

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
          appBar: AppBar(
            title: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                      prefix: Icons.person,
                      controller: fNameController,
                      label: '${person!.fName}',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First Name Must Not Be Empty';
                        }
                      }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      prefix: Icons.person,
                      controller: lNameController,
                      label: '${person.lName}',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Last Name Must Not Be Empty';
                        }
                      }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      prefix: Icons.person,
                      hintText: 'Your clinic name in the app..',
                      controller: userNameController,
                      label: '${person.Username}',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username Must Not Be Empty';
                        }
                      }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      prefix: Icons.access_time,
                      controller: clinicWorkHoursFromController,
                      label: '${person.workHoursFrom}',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Work Hours Must Not Be Empty';
                        }
                      },
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now()

                        ).then((value) {
                          clinicWorkHoursFromController.text =
                          value!.format(context);
                        });
                      }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      prefix: Icons.access_time_filled_outlined,
                      controller: clinicWorkHoursToController,
                      label: '${person.workHoursTo}',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Work Hours Must Not Be Empty';
                        }
                      },
                        onTap: () {
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now()
                          ).then((value) {
                            clinicWorkHoursToController.text = value!.format(context);
                          });
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                          text: 'CONFIRM',
                          onPressed:() async{
                            if (formKey.currentState!.validate()){
                              person.fName = fNameController.text;
                              person.lName = lNameController.text;
                              person.Username = userNameController.text;
                              person.workHoursFrom = clinicWorkHoursFromController.text;
                              person.workHoursTo = clinicWorkHoursToController.text;
                              await database.setClinicPerson(person, person.uID);
                            }
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClinicLayout(),
                              )
                            );
                          },
                        ),
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