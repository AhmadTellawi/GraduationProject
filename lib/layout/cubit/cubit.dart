import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/models/models.GigaPet/Clinic_Model.dart';
import 'package:gigapet/modules/chats/chats.dart';
import 'package:gigapet/modules/community/community_screen.dart';
import 'package:gigapet/modules/homee/home_screen.dart';
import 'package:gigapet/modules/profile/owner_profile_screen.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(): super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  bool isConfirmPassword = true;
  int currentIndex = 2;
  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.post_add_sharp
      ),
      label: 'Community'
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.post_add_sharp
      ),
      label: 'Chats'
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home
      ),
      label: 'Home'
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person
      ),
      label: 'Profile'
    ),
  ];
  List<Widget> screens = [
    CommunityScreen(),
    ChatsScreen(),
    HomeScreen(),
    ProfileScreen()
  ]; 
  List<String> titles = [
    'Community',
    'Chats',
    'Home',
    'Profile'
  ];

   void changeBottomIndex(index){
    currentIndex = index;
    emit(BottomNavIndexChangedState());
  }

  void changeVisibility(){
    isPassword = !isPassword;
    emit(PasswordVisibilityState());
  }

  void changeConfirmVisibility(){
    isConfirmPassword = !isConfirmPassword;
    emit(PasswordVisibilityState());
  }
  late String username;
  void getData() async {
    await for (var messages in FirebaseFirestore.instance.collection('PetOwnerUsers').snapshots())
    {
      var message = messages.docs.toList().elementAt(2).get('Username') ;
      print(message.toString());
      username = message.toString();
    }
  }

   List<ClinicOwnerModel> clinic = [];

  //  void getClinic(){
  //   FirebaseFirestore.instance.collection('/ClinicOwnerUsers/').get().then((value) {
  //     value.docs.forEach((element) { 
  //       clinic.add(ClinicOwnerModel.fromJson(element.data()));
  //     })
  //   });
  //  }

  
}