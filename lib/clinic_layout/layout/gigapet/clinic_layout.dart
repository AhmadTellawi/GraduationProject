import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/clinic_layout/layout/cubit/cubit.dart';
import 'package:gigapet/clinic_layout/layout/cubit/states.dart';


class ClinicLayout extends StatelessWidget {
  const ClinicLayout({ Key? key }) : super(key: key);


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