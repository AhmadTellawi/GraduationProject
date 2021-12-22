import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/models/models.GigaPet/Clinic_Model.dart';
import 'package:gigapet/models/models.GigaPet/PetOwner_Model.dart';
import 'package:gigapet/models/models.GigaPet/Store_model.dart';
import 'package:gigapet/modules/sign_up/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  bool isPassword = true;
  bool isConfirmPassword = true;

  void changeVisibility() {
    isPassword = !isPassword;
    emit(PasswordVisibilityState());
  }

  void changeConfirmVisibility() {
    isConfirmPassword = !isConfirmPassword;
    emit(PasswordVisibilityState());
  }

  void ownerRegister({
    required String fName,
    required String lName,
    required String email,
    required String username,
    required String password,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createUserOwner(
        uID: value.user!.uid,
        email: email,
        fName: fName,
        lName: lName,
        Username: username,
      );
      emit(RegisterSuccessState());
    })
        .catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void createUserOwner({
    required String fName,
    required String lName,
    required String Username,
    required String email,
    required String uID,
  })
{
PetOwnerModel model = PetOwnerModel(
email,
fName,
lName,
Username,
uID,

);
FirebaseFirestore.instance
    .collection("PetOwnerUsers")
    .doc(uID)
    .set(model.toMap())
    .then((value)
{

})
    .catchError((error) {

});
}

  // void petRegister({
  //   required String petName,
  //   required String petType,
  //   required String breed,
  //   required String dateOfBirth,
  //
  // }){
  //   emit(RegisterLoadingState());
  // }

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
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password)
        .then((value){
      print(value.user!.email);
      print(value.user!.uid);

      createUserStore(
        uID: value.user!.uid,
        email: email,
        fName: fName,
        lName: lName,
        Username: username,
        workHoursFrom: workHoursFrom,
        workHoursTo: workHoursTo,
        Address: address,
      );
      emit(RegisterSuccessState());
    })
        .catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void createUserStore({
    required String fName,
    required String lName,
    required String Username,
    required String email,
    required String uID,
    required String workHoursFrom,
    required String workHoursTo,
    required String Address,
  })
  {
    StoreOwnerModel model = StoreOwnerModel(
      email,
      fName,
      lName,
      Username,
      uID,
      workHoursFrom,
      workHoursTo,
      Address,
    );
    FirebaseFirestore.instance
        .collection("StoreOwnerUsers")
        .doc(uID)
        .set(model.toMap())
        .then((value)
    {

    })
        .catchError((error) {

    });
  }

   void clinicRegister({
    required String fName,
    required String lName,
    required String email,
    required String username,
    required String password,
    required String password2,
    required String workHoursFrom,
    required String workHoursTo,
    required String address,

  })   {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password)
        .then((value){
      print(value.user!.email);
      print(value.user!.uid);
      createUserClinic(
        uID: value.user!.uid,
        email: email,
        fName: fName,
        lName: lName,
        Username: username,
        workHoursFrom: workHoursFrom,
        workHoursTo: workHoursTo,
        Address: address,
      );
      emit(RegisterSuccessState());
    })
        .catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
   }

  void createUserClinic({
    required String fName,
    required String lName,
    required String Username,
    required String email,
    required String uID,
    required String workHoursFrom,
    required String workHoursTo,
    required String Address,
  })
  {
    ClinicOwnerModel model = ClinicOwnerModel(
      email,
      fName,
      lName,
      Username,
      uID,
      workHoursFrom,
      workHoursTo,
      Address,
    );
    FirebaseFirestore.instance
        .collection("ClinicOwnerUsers")
        .doc(uID)
        .set(model.toMap())
        .then((value)
    {

    })
        .catchError((error) {

    });
  }
}


//Sign-up
//SignUp