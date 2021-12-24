import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/clinic_layout/layout/cubit/cubit.dart';
import 'package:gigapet/clinic_layout/layout/cubit/states.dart';
import 'package:gigapet/store_layout/layout/cubit/cubit.dart';
import 'package:gigapet/store_layout/layout/cubit/states.dart';


class StoreLayout extends StatelessWidget {
  const StoreLayout({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(),
      child: BlocConsumer<StoreCubit, Storetates>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          var cubit = StoreCubit.get(context);
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