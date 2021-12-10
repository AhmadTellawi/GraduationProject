abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{}

class RegisterErrorState extends RegisterStates{
  final String? error;
  RegisterErrorState(String string, {this.error});
}

class PasswordVisibilityState extends RegisterStates{}