import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/layout/cubit/cubit.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/modules/identity/identity_screen.dart';
import 'package:gigapet/modules/sign_up/owner_sign_up_screen.dart';
import 'package:gigapet/shared/components/components.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({Key? key}) : super(key: key);


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {



  var formKey = GlobalKey<FormState>();

  var passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
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
                      label: 'Email Address',
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Email Must Not Be Empty';
                        }
                      }
                    ),
                    const SizedBox(height: 20),
                     defaultFormField(
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
                        cubit.chnageVisibility();
                      }
                    ),
                    const SizedBox(height: 20),
                    defaultButton(
                      text: 'LOGIN',
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const GigaPetLayout()
                            )
                          );
                        }
                      }
                    ),
                    Row(
                      children: [
                        Text('don\'t have an account?'),
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
                          child: Text('Sign Up!')
                    )
                      ],
                    ),
                    defaultButton(
                      text: 'TAKE A LOOK',
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const GigaPetLayout()
                            )
                          );
                        }
                      }
                    ),
                    Row(
                      children: [
                        Text('forgot your password?'),
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
                          child: Text(
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