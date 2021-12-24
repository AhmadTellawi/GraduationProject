import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/store_sign_in/cubit/states.dart';


class StoreLoginCubit extends Cubit<StoreLoginStates>{
  StoreLoginCubit() : super(StoreLoginInitialState());
  static StoreLoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  bool isConfirmPassword = true;
  void changeVisibility(){
    isPassword = !isPassword;
    emit(PasswordVisibilityState());
  }

  void userLogin({
    required String email,
    required String password
  }){
    emit(StoreLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword
      (
        email: email,
        password: password,
    ).then((value){
      print(value.user!.email);
      print(value.user!.uid);
      emit(StoreLoginSuccessState());
    })
    .catchError((error){
      emit(StoreLoginErrorState(error.toString()));
      print(error.toString());
      print('Invalid Inputs');
    }
);
  }
}