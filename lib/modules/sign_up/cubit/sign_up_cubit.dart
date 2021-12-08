import 'package:bloc/bloc.dart';
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

  void userRegister({
    required String fName,
    required String lName,
    required String email,
    required String username,
    required String password,
  }){
    emit(RegisterLoadingState());
  }

  void petRegister({
    required String petName,
    required String petType,
    required String breed,
    required String dateOfBirth,
    
  }){
    emit(RegisterLoadingState());
  }
}