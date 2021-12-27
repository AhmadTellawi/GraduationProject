abstract class AppStates{}

class AppInitState extends AppStates{}

class BottomNavIndexChangedState extends AppStates{}

class PasswordVisibilityState extends AppStates{}

class SignInState extends AppStates{}

class GetAllUsersLoadingState extends AppStates{}

class GetAllUsersSuccessState extends AppStates{}

class GetAllUsersErrorState extends AppStates{
  
  final String error;
  GetAllUsersErrorState(this.error);
}




