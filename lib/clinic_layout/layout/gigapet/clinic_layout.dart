import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/clinic_layout/layout/cubit/cubit.dart';
import 'package:gigapet/clinic_layout/layout/cubit/states.dart';
import 'package:gigapet/clinic_sign_in/sign_in_screen.dart';
import 'package:gigapet/store_sign_in/sign_in_screen.dart';


class ClinicLayout extends StatelessWidget {
   ClinicLayout({ Key? key }) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  logOut() async {
    await auth.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClinicCubit(),
      child: BlocConsumer<ClinicCubit, Clinictates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit = ClinicCubit.get(context);
          return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: (){
                  logOut();
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => ClinicSignInScreen(),
                    )
                  );
                }, 
                child: Text(
                  'Logout'
                ),
                
              ),
            )
          ],
          title:  Text(
            '${cubit.titles[cubit.currentIndex]}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black
            ),
          ),
        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          items: cubit.navBarItems,
          onTap: (index){
            cubit.changeBottomIndex(index);
          },
        ),
        
      );
        }, 
        
      )
    );
  }
}