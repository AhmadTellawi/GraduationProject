import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/layout/cubit/cubit.dart';
import 'package:gigapet/layout/cubit/states.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';

class GigaPetLayout extends StatelessWidget {
  GigaPetLayout({ Key? key }) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;
  logOut() async {
    await auth.signOut();
  }
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
                      builder: (context) => SignInScreen(),
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