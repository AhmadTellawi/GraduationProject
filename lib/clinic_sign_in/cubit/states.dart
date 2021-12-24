abstract class ClinicLoginStates{}

class ClinicLoginInitialState extends ClinicLoginStates{}

class ClinicLoginLoadingState extends ClinicLoginStates{}

class ClinicLoginSuccessState extends ClinicLoginStates{}

class ClinicLoginErrorState extends ClinicLoginStates{

  final String? error;
  ClinicLoginErrorState(String string, {this.error});

}

class CreateUserSuccessState extends ClinicLoginStates{}

class CreateUserErrorState extends ClinicLoginStates{

  final String? error;
  CreateUserErrorState(String string, {this.error});

}

class PasswordVisibilityState extends ClinicLoginStates{}