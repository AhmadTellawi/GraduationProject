import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/clinic_sign_in/cubit/states.dart';


class ClinicLoginCubit extends Cubit<ClinicLoginStates>{
  ClinicLoginCubit() : super(ClinicLoginInitialState());
  static ClinicLoginCubit get(context) => BlocProvider.of(context);

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
    emit(ClinicLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword
      (
        email: email,
        password: password,
    ).then((value){
      print(value.user!.email);
      print(value.user!.uid);
      emit(ClinicLoginSuccessState());
    })
    .catchError((error){
      emit(ClinicLoginErrorState(error.toString()));
      print(error.toString());
      print('Invalid Inputs');
    }
);
  }
}