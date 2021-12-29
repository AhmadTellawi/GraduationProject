import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/database/database.dart';
import 'package:gigapet/layout/cubit/cubit.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/models/models.GigaPet/Clinic_Model.dart';
import 'package:gigapet/models/models.GigaPet/PetOwner_Model.dart';
import 'package:gigapet/modules/community/list_items_builder.dart';

class ClinicChats extends StatefulWidget {
  ClinicChats({ Key? key }) : super(key: key);
  @override
  _ClinicChatsState createState() => _ClinicChatsState();
}

class _ClinicChatsState extends State<ClinicChats> {
  @override
  Widget build(BuildContext context) {
     FirebaseAuth auth = FirebaseAuth.instance;
     Database database =  FirestoreDatabase(uid: auth.currentUser!.uid);
          return StreamBuilder<List<PetOwnerModel>>(
            stream: database.PetOwnersStream(),
            builder: (context, snapshot) {
              return ListItemsBuilder<PetOwnerModel>(
                snapshot: snapshot,
                itemBuilder: (context, petOwner) {
                  return buildChatItem(petOwner);
                },
              );
            }
          );
       }
  }


Widget buildChatItem(PetOwnerModel petOwner) => InkWell(
  onTap: (){},
  child:   Padding(
    padding:  EdgeInsets.all(20),
    child:   Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepOrange,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          petOwner.Username,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  ),
);