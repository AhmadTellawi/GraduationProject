import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gigapet/database/database.dart';
import 'package:gigapet/models/models.GigaPet/PetOwner_Model.dart';
import 'package:gigapet/modules/profile/owner_profile_screen.dart';
import 'package:gigapet/shared/components/components.dart';
import 'package:intl/intl.dart';

class PetOwnerEditProfileScreen extends StatefulWidget {
  const PetOwnerEditProfileScreen({ Key? key }) : super(key: key);


  @override
  _PetOwnerEditProfileScreenState createState() => _PetOwnerEditProfileScreenState();
}

class _PetOwnerEditProfileScreenState extends State<PetOwnerEditProfileScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  Database database =  FirestoreDatabase(uid: FirebaseAuth.instance.currentUser!.uid) ;

  var fNameController = TextEditingController();

  var lNameController = TextEditingController();

  var userNameController = TextEditingController();

  var petNameController = TextEditingController();

  var petTypeController = TextEditingController();

  var petBreedController = TextEditingController();

  var dateOfBirthController = TextEditingController();

  var formKey = GlobalKey<FormState>();

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
                      controller: fNameController,
                      label: '${person!.fName}',
                      prefix: Icons.person
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      controller: lNameController,
                      label: '${person!.lName}',
                      prefix: Icons.person
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                      controller: userNameController,
                      label: '${person!.Username}',
                      prefix: Icons.person
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
                        defaultFormField(
                          controller: petNameController,
                          label: '${person!.petName}',
                          prefix: Icons.pets_outlined
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: petTypeController,
                          label: '${person!.petType}',
                          prefix: Icons.pets_outlined
                        ),
                            SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: petBreedController,
                          label: '${person!.petBreed}',
                          prefix: Icons.pets_outlined
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                          controller: dateOfBirthController,
                          label: '${person!.petBirth}',
                          prefix: Icons.date_range_outlined,
                          onTap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.parse('1990-01-01'),
                              firstDate: DateTime.parse('1990-01-01'),
                              lastDate: DateTime.now()
                            ).then((value) {
                              dateOfBirthController.text = DateFormat.MMMMEEEEd().format(value!);
                            });
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
          ),
        );
      }
    );
  }
}