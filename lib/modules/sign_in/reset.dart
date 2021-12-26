import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gigapet/layout/cubit/cubit.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/modules/identity/identity_screen.dart';
import 'package:gigapet/modules/sign_up/owner_sign_up_screen.dart';
import 'package:gigapet/shared/components/components.dart';

import 'cubit/sign_in_cubit.dart';
import 'cubit/states.dart';

class resetScreen extends StatefulWidget {

  const resetScreen({Key? key}) : super(key: key);


  @override
  State<resetScreen> createState() => _resetScreenState();
}

class _resetScreenState extends State<resetScreen> {



  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();


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

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Reset",
                          style: TextStyle(
                              fontSize: 26,
                          ),
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: 40,),
                    defaultFormField(
                      keyboardtype: TextInputType.emailAddress,
                      controller: emailController,
                      prefix: Icons.mail,
                      label: 'Email Address',
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Email Must Not Be Empty';
                        }
                      }
                    ),

                    const SizedBox(
                      height: 20
                    ),
                    defaultButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          {
                            FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text,)
                              .then((value){

                              Navigator.of(context).pop();
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
                      text: 'Send Reset Request',
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