
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/modules/sign_in/cubit/states.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';
import 'package:gigapet/modules/sign_up/cubit/states.dart';
import 'package:gigapet/modules/sign_up/pet_sign_up_screen.dart';
import 'package:gigapet/shared/components/components.dart';
import 'cubit/sign_up_cubit.dart';

class OwnerSignUpScreen extends StatefulWidget {
  const OwnerSignUpScreen({Key? key}) : super(key: key);


  @override
  State<OwnerSignUpScreen> createState() => _OwnerSignUpScreenState();

}

class _OwnerSignUpScreenState extends State<OwnerSignUpScreen> {

  bool isPassword = true;
  bool isPasswordConfirm = true;
  var formKey = GlobalKey<FormState>();
  var passWordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var userNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserSuccessState)
            {
              Navigator.pushReplacement(
                context,
                  MaterialPageRoute(
                    builder: (context) =>  GigaPetLayout()
                  )

              );
            }
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
                        prefix: Icons.person,
                        label: 'First Name',
                        controller: fNameController,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'First Name Must Not Be Empty';
                          }
                        }
                      ),
                      const SizedBox(height: 20),
          
                       defaultFormField(

                        prefix: Icons.person,
                        label: 'Last Name',
                        controller: lNameController,
                        validator: (value){
                          if(value!.isEmpty){
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
                        label: 'Username',
                        hintText: 'What people see in the app..',
                        controller: userNameController,
                        validator: (value){
                          if(value!.isEmpty){
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
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Confirm Your Password';
                          } else if (passWordController.text != confirmPasswordController.text){
                            return 'Passwords do not match';
                          }
                        },
                        controller: confirmPasswordController,
                        keyboardtype: TextInputType.visiblePassword,
                        label: 'Confirm Password',
                        isPassowrd: cubit.isConfirmPassword,
                        icon: cubit.isConfirmPassword? Icons.visibility : Icons.visibility_off,
                        iconPressed: (){
                          cubit.changeConfirmVisibility();
                        }
                      ),
                      const SizedBox(height: 20),
                     BuildCondition(
                         condition: state is! RegisterLoadingState,
                          builder: (context) => defaultButton(
                            onPressed: ()
                          {
                            if (formKey.currentState!.validate())
                              {
                                RegisterCubit.get(context).ownerRegister(
                                  fName: fNameController.text,
                                  lName: lNameController.text,
                                  username: userNameController.text,
                                  email: emailController.text,
                                  password: passWordController.text,
                                );
                                Navigator.pushReplacement(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  )
                                );
                              }
                          },
                       text: 'Register',
                          ),
                       fallback: (context) =>
                           Center(child: CircularProgressIndicator()),
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