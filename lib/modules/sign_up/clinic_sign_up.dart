import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/clinic_sign_in/sign_in_screen.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/modules/sign_up/cubit/states.dart';
import 'package:gigapet/modules/sign_up/pet_sign_up_screen.dart';
import 'package:gigapet/shared/components/components.dart';
import 'cubit/sign_up_cubit.dart';


class ClinicSignUpScreen extends StatefulWidget {
  const ClinicSignUpScreen({ Key? key }) : super(key: key);

  @override
  _ClinicSignUpScreenState createState() => _ClinicSignUpScreenState();
}

class _ClinicSignUpScreenState extends State<ClinicSignUpScreen> {

  bool isPassword = true;
  bool isPasswordConfirm = true;
  var formKey = GlobalKey<FormState>();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passWordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var clinicWorkHoursFromController = TextEditingController();
  var clinicWorkHoursToController = TextEditingController();
  var clinicAddressController = TextEditingController();

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
                         const SizedBox(height: 20,),
                         defaultFormField(
                           prefix: Icons.person,
                            controller: fNameController,
                            label: 'First Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'First Name Must Not Be Empty';
                              }
                            }
                         ),
                         const SizedBox(height: 20),

                         defaultFormField(
                           prefix: Icons.person,
                            controller: lNameController,
                            label: 'Last Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Last Name Must Not Be Empty';
                              }
                             }
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          prefix: Icons.mail,
                          hintText: 'This will be used when you sign in..',
                          keyboardtype: TextInputType.emailAddress,
                          controller: emailController,
                          label: 'Email Address',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Email Must Not Be Empty';
                            }
                          }
                        ),
                         const SizedBox(height: 20),
                         defaultFormField(
                          prefix: Icons.person,
                            hintText: 'Your clinic name in the app..',
                            controller: userNameController,
                            label: 'Username',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Username Must Not Be Empty';
                              }
                            }
                         ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          prefix: Icons.lock_outline,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Password Must Not Be Empty';
                              }
                            },
                            controller: passWordController,
                            label: 'Password',
                            keyboardtype: TextInputType.visiblePassword,
                            isPassowrd: cubit.isPassword,
                            icon: cubit.isPassword? Icons.visibility : Icons.visibility_off,
                            iconPressed: (){
                              cubit.changeVisibility();
                            }
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          prefix: Icons.lock,
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
                       const SizedBox(height: 20,),
                        defaultFormField(
                          prefix: Icons.access_time,
                          controller: clinicWorkHoursFromController,
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
                                clinicWorkHoursFromController.text =
                                    value!.format(context);
                              });
                            }

                        ),
                       const SizedBox(height: 20),
                        defaultFormField(
                          prefix: Icons.access_time_filled_outlined,
                            controller: clinicWorkHoursToController,
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
                                clinicWorkHoursToController.text =
                                    value!.format(context);
                              });
                            }
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          prefix: Icons.location_on,
                            controller: clinicAddressController,
                            label: 'Clinic Address',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Address Must Not Be Empty';
                              }
                            }
                        ),
                        const SizedBox(height: 20),
                        BuildCondition(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defaultButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate())
                                  {
                                    RegisterCubit.get(context).clinicRegister(
                                      fName: fNameController.text,
                                      lName: lNameController.text,
                                      username: userNameController.text,
                                      email: emailController.text,
                                      password: passWordController.text,
                                      password2: confirmPasswordController.text,
                                     workHoursFrom: clinicWorkHoursFromController.text,
                                      workHoursTo: clinicWorkHoursToController.text,
                                     address: clinicAddressController.text,

                                    );
                                  }
                                  Navigator.pushReplacement(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context) => ClinicSignInScreen(),
                                    )
                                  );
                                },
                                text: 'Register',
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),

                        ),
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
