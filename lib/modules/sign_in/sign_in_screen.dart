import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gigapet/anonymous_layout/anonymous_layout/layout/gigapet/clinic_layout.dart';
import 'package:gigapet/layout/cubit/cubit.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/modules/identity/identity_screen.dart';
import 'package:gigapet/modules/sign_in/reset.dart';
import 'package:gigapet/modules/sign_up/owner_sign_up_screen.dart';
import 'package:gigapet/shared/components/components.dart';

import 'cubit/sign_in_cubit.dart';
import 'cubit/states.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({Key? key}) : super(key: key);


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {



  var formKey = GlobalKey<FormState>();
  var passWordController = TextEditingController();
  var emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginErrorState)
            {
               Fluttertoast.showToast(msg: state.toString() );
            }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign In",
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
                    const SizedBox(height: 40,),
                    defaultFormField(
                      keyboardtype: TextInputType.emailAddress,
                        controller: emailController,
                      label: 'Email Address',
                      prefix: Icons.mail,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Email Must Not Be Empty';
                        }
                      }
                    ),
                    const SizedBox(height: 20),
                     defaultFormField(
                       prefix: Icons.lock,
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
                    defaultButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          {
                            FirebaseAuth.instance.signInWithEmailAndPassword
                              (
                              email: emailController.text,
                              password: passWordController.text,
                            ).then((value){
                              print(value.user!.email);
                              print(value.user!.uid);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  GigaPetLayout()
                                  )
                              );
                            })
                                .catchError((error){
                              Fluttertoast.showToast(msg: "invalid inputs, please Try Again" );
                              print(error.toString());
                              print('Invalid Inputs');
                            }
                            );
                          }

                        }
                      },
                      text: 'LOGIN',
                    ),
                    if (state is LoginLoadingState)
                      Center(child: CircularProgressIndicator()),
                    Row(
                      children: [
                        const Text('don\'t have an account?'),
                        TextButton(
                          onPressed: (){
                            setState(() {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => IdentityScreen(),
                                )
                              );
                            });
                          }, 
                          child: const Text(
                            'Sign Up!'
                          )
                    )
                      ],
                    ),
                    defaultButton(
                      text: 'TAKE A LOOK',
                      onPressed: (){
                        auth.signInAnonymously();
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) =>  AnonymousLayout()
                          )
                        );
                      }
                    ),
                    Row(
                      children: [
                        const Text(
                          'forgot your password?'
                        ),
                        TextButton(
                            onPressed: (){
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => resetScreen(),
                                    )
                                );
                              });
                            },
                            // onPressed: (){
                            //   setState(() {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => IdentityScreen(),
                            //         )
                            //     );
                            //   });
                            // },
                          child: const Text(
                            'Reset',
                          )
                        )
                      ],
                    )
                  ],
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