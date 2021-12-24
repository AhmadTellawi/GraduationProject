abstract class StoreLoginStates{}

class StoreLoginInitialState extends StoreLoginStates{}

class StoreLoginLoadingState extends StoreLoginStates{}

class StoreLoginSuccessState extends StoreLoginStates{}

class StoreLoginErrorState extends StoreLoginStates{

  final String? error;
  StoreLoginErrorState(String string, {this.error});

}

class CreateUserSuccessState extends StoreLoginStates{}

class CreateUserErrorState extends StoreLoginStates{

  final String? error;
  CreateUserErrorState(String string, {this.error});

}

class PasswordVisibilityState extends StoreLoginStates{}