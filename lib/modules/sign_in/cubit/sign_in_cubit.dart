import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/modules/sign_in/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);


  bool isPassword = true;
  bool isConfirmPassword = true;
  void changeVisibility(){
    isPassword = !isPassword;
    emit(PasswordVisibilityState());
  }

  // void userLogin({
  //   required String email,
  //   required String password
  // }){}
}