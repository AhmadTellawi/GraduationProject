import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/layout/cubit/cubit.dart';
import 'package:gigapet/layout/cubit/states.dart';

class GigaPetLayout extends StatelessWidget {
  const GigaPetLayout({ Key? key }) : super(key: key);


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
                onPressed: (){}, 
                child: Text('Logout')
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