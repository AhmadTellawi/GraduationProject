import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/database/database.dart';
import 'package:gigapet/layout/cubit/cubit.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/models/models.GigaPet/Clinic_Model.dart';
import 'package:gigapet/modules/community/list_items_builder.dart';

class ChatsScreen extends StatefulWidget {
  ChatsScreen({ Key? key }) : super(key: key);
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
     FirebaseAuth auth = FirebaseAuth.instance;
     Database database =  FirestoreDatabase(uid: auth.currentUser!.uid);
          return StreamBuilder<List<ClinicOwnerModel>>(
            stream: database.ClinicOwnersStream(),
            builder: (context, snapshot) {
              return ListItemsBuilder<ClinicOwnerModel>(
                snapshot: snapshot,
                itemBuilder: (context, clinicOwner) {
                  return buildChatItem(clinicOwner);
                },
              );
            }
          );
       }
  }


Widget buildChatItem(ClinicOwnerModel clinicOwner) => InkWell(
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
          clinicOwner.Username,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  ),
);