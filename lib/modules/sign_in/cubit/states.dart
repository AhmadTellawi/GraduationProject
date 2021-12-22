abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{}

class LoginErrorState extends LoginStates{

  final String? error;
  LoginErrorState(String string, {this.error});

}

class CreateUserSuccessState extends LoginStates{}

class CreateUserErrorState extends LoginStates{

  final String? error;
  CreateUserErrorState(String string, {this.error});

}

class PasswordVisibilityState extends LoginStates{}