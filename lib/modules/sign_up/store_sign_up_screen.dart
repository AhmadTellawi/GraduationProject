import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/shared/components/components.dart';

import 'cubit/sign_up_cubit.dart';
import 'cubit/states.dart';

class StoreSignUpScreen extends StatefulWidget {
  const StoreSignUpScreen({ Key? key }) : super(key: key);

  @override
  _StoreSignUpScreenState createState() => _StoreSignUpScreenState();
}

class _StoreSignUpScreenState extends State<StoreSignUpScreen> {

  bool isPassword = true;
  bool isPasswordConfirm = true;
  var formKey = GlobalKey<FormState>();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var userNameController = TextEditingController();
  var passWordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var storeWorkHoursFromController = TextEditingController();
  var storeWorkHoursToController = TextEditingController();
  var storeAddressController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => RegisterCubit(),
    child: BlocConsumer<RegisterCubit, RegisterStates>(
    listener: (context, state) {

    },
    builder: (context, state) {
      var cubit = RegisterCubit.get(context);
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 35
                      ),
                    ),
                    const Text(
                        'Gigapet',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    SizedBox(height: 20,),
                    defaultFormField(
                        label: 'First Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'First Name Must Not Be Empty';
                          }
                        }
                    ),
                    const SizedBox(height: 20),

                    defaultFormField(
                        label: 'Last Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Last Name Must Not Be Empty';
                          }
                        }
                    ),
                    const SizedBox(height: 20),
                    defaultFormField(
                        keyboardtype: TextInputType.emailAddress,
                        hintText: 'This will be used when you sign in..',
                        controller: emailController,
                        label: 'Email Address',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email Must Not Be Empty';
                          }
                        }
                    ),
                    const SizedBox(height: 20),
                    defaultFormField(
                        hintText: 'Your store name in the app..',
                        label: 'Username',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username Must Not Be Empty';
                          }
                        }
                    ),
                    const SizedBox(height: 20),
                    defaultFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password Must Not Be Empty';
                          }
                        },
                        controller: passWordController,
                        label: 'Password',
                        keyboardtype: TextInputType.visiblePassword,
                        isPassowrd: isPassword,
                        icon: isPassword ? Icons.visibility : Icons
                            .visibility_off,
                        iconPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        }
                    ),
                    const SizedBox(height: 20),
                    defaultFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Confirm Your Password';
                          } else if (passWordController.text !=
                              confirmPasswordController.text) {
                            return 'Passwords do not match';
                          }
                        },
                        controller: confirmPasswordController,
                        keyboardtype: TextInputType.visiblePassword,
                        label: 'Confirm Password',
                        isPassowrd: isPasswordConfirm,
                        icon: isPasswordConfirm ? Icons.visibility : Icons
                            .visibility_off,
                        iconPressed: () {
                          setState(() {
                            isPasswordConfirm = !isPasswordConfirm;
                          });
                        }
                    ),
                    const SizedBox(height: 20),
                    defaultFormField(
                        controller: storeWorkHoursFromController,
                        label: 'Work Hours From',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Work Hours Must Not Be Empty';
                          }
                        },
                        onTap: () {
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now()
                          ).then((value) {
                            storeWorkHoursFromController.text =
                                value.toString();
                          });
                        }

                    ),
                    const SizedBox(height: 20),
                    defaultFormField(
                        controller: storeWorkHoursToController,
                        label: 'Work Hours To',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Work Hours Must Not Be Empty';
                          }
                        },
                        onTap: () {
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now()
                          ).then((value) {
                            storeWorkHoursToController.text =
                                value.toString();
                          });
                        }
                    ),
                    const SizedBox(height: 20),
                    defaultFormField(
                        controller: storeAddressController,
                        label: 'Store Address',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address Must Not Be Empty';
                          }
                        }
                    ),
                    const SizedBox(height: 20),
                    BuildCondition(
                      condition: state is! RegisterLoadingState,
                      builder: (context) =>
                          defaultButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).storeRegister(
                                  fName: fNameController.text,
                                  lName: lNameController.text,
                                  username: userNameController.text,
                                  email: emailController.text,
                                  password: passWordController.text,
                                  workHoursFrom: storeWorkHoursFromController
                                      .text,
                                  workHoursTo: storeWorkHoursToController.text,
                                  address: storeAddressController.text,
                                );
                              }
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const PetSignUpScreen()
                              //     )
                              // );
                            },
                            text: 'Register',
                          ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    // defaultButton(
                    //   text: 'SIGN UP',
                    //   onPressed: (){
                    //     if(formKey.currentState!.validate()){
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const GigaPetLayout()
                    //         )
                    //       );
                    //     }
                    //   }
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    ),
    );

  }
}