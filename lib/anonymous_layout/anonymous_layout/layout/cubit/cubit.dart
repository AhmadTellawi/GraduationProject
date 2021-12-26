import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/clinic_layout/layout/cubit/states.dart';
import 'package:gigapet/modules/community/community_screen.dart';
import 'package:gigapet/modules/homee/home_screen.dart';
import 'package:gigapet/modules/identity/identity_screen.dart';
import 'package:gigapet/modules/profile/clinic_profile_screen.dart';

class AnonymousCubit extends Cubit<AnonymousStates>{
  AnonymousCubit(): super(AppInitState());

  static AnonymousCubit get(context) => BlocProvider.of(context);
  
  bool isPassword = true;
  bool isConfirmPassword = true;
  int currentIndex = 1;
  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.post_add_sharp
      ),
      label: 'Community'
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
      label: 'Sign Up'
    ),
  ];
  List<Widget> screens = [
    CommunityScreen(),
    const HomeScreen(),
    IdentityScreen()
  ]; 
  List<String> titles = [
    'Community',
    'Home',
    'Sign Up'
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

  void identifyUser(){
    emit(ClinicSignInState());
  }


   

  
}