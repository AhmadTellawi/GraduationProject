import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gigapet/database/database.dart';
import 'package:gigapet/models/models.GigaPet/Store_model.dart';
import 'package:gigapet/modules/profile/clinic_profile_screen.dart';
import 'package:gigapet/modules/profile/store_profile_screen.dart';
import 'package:gigapet/shared/components/components.dart';
import 'package:gigapet/store_layout/layout/gigapet/store_layout.dart';

class StoreEditProfileScreen extends StatefulWidget {
  StoreEditProfileScreen({ Key? key }) : super(key: key);

  @override
  State<StoreEditProfileScreen> createState() => _StoreEditProfileScreenState();
}

class _StoreEditProfileScreenState extends State<StoreEditProfileScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  Database database =  FirestoreDatabase(uid: FirebaseAuth.instance.currentUser!.uid) ;

  var fNameController = TextEditingController();

  var lNameController = TextEditingController();

  var userNameController = TextEditingController();

  var StoreWorkHoursFromController = TextEditingController();

  var StoreWorkHoursToController = TextEditingController();

  var StoreAddressController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<StoreOwnerModel>(
        stream: database.StoreOwnerStream(personId: currentUser!.uid),
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
                        hintText: 'Your Store name in the app..',
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
                      controller: StoreWorkHoursFromController,
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
                            StoreWorkHoursFromController.text =
                                value!.format(context);
                          });
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      prefix: Icons.access_time_filled_outlined,
                        controller: StoreWorkHoursToController,
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
                            StoreWorkHoursToController.text = value!.format(context);
                          });
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                          text: 'CONFIRM',
                          onPressed: ()async{
                            if (formKey.currentState!.validate()){
                              person.fName = fNameController.text;
                              person.lName = lNameController.text;
                              person.Username = userNameController.text;
                              person.workHoursFrom = StoreWorkHoursFromController.text;
                              person.workHoursTo = StoreWorkHoursToController.text;

                              await database.setStorePerson(person, person.uID);
                            }
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StoreLayout(),
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