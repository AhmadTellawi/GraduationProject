import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/modules/community/community_screen.dart';
import 'package:gigapet/modules/homee/home_screen.dart';
import 'package:gigapet/modules/profile/store_profile_screen.dart';
import 'package:gigapet/store_layout/layout/cubit/states.dart';

class StoreCubit extends Cubit<Storetates>{
  StoreCubit(): super(AppInitState());

  static StoreCubit get(context) => BlocProvider.of(context);
  
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
    const HomeScreen(),
    const StoreProfileScreen()
  ]; 
  List<String> titles = [
    'Community',
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

  void identifyUser(){
    emit(StoreSignInState());
  }


   

  
}