import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/layout/cubit/cubit.dart';
import 'package:gigapet/layout/cubit/states.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({ Key? key }) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          
        },
         builder: (context, state) {
            var cubit = AppCubit.get(context);
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildChatItem(), 
              separatorBuilder: (context, index) => SizedBox(height: 10,), 
              itemCount: 10
            );
         }
      ),
    );
  }
}

Widget buildChatItem() => InkWell(
  onTap: (){},
  child:   Padding(
    padding: const EdgeInsets.all(20),
    child:   Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepOrange,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Abdullah Helmi',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  ),
);