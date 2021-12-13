import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/modules/sign_up/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);


  bool isPassword = true;
  bool isConfirmPassword = true;
  void changeVisibility(){
    isPassword = !isPassword;
    emit(PasswordVisibilityState());
  }

  void changeConfirmVisibility(){
    isConfirmPassword = !isConfirmPassword;
    emit(PasswordVisibilityState());
  }

    void ownerRegister({
    required String fName,
    required String lName,
    required String email,
    required String username,
    required String password,
  }){
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password)
    .then((value){
      print(value.user!.email);
      print(value.user!.uid);
      emit(RegisterSuccessState());
    })
    .catchError((error){
      emit(RegisterErrorState(error.toString()));
    });
  }

  void petRegister({
    required String petName,
    required String petType,
    required String breed,
    required String dateOfBirth,
    
  }){
    emit(RegisterLoadingState());
  }

  void storeRegister({
    required String fName,
    required String lName,
    required String email,
    required String username,
    required String password,
    required String workHoursFrom,
    required String workHoursTo,
    required String address,

  }){
    emit(RegisterLoadingState());

  }

  void clinicRegister({
    required String fName,
    required String lName,
    required String username,
    required String email,
    required String password,
    required String password2,
    required String workHoursFrom,
    required String workHoursTo,
    required String address,

  }){
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password)
        .then((value){
      print(value.user!.email);
      print(value.user!.uid);
      emit(RegisterSuccessState());
    })
        .catchError((error){
      emit(RegisterErrorState(error.toString()));
    });
  }
}


//Sign-up
//SignUp