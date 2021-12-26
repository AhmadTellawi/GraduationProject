import 'package:flutter/material.dart';
import 'package:gigapet/modules/sign_up/clinic_sign_up.dart';
import 'package:gigapet/modules/sign_up/owner_sign_up_screen.dart';
import 'package:gigapet/modules/sign_up/store_sign_up_screen.dart';

class IdentityScreen extends StatelessWidget {
  const IdentityScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Who would you',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'like to join Gigapet as?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 40
                  ),
            
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => OwnerSignUpScreen(),
                        )
                      );
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.only(start: 14),
                      width: double.infinity,
                      color: Colors.blue,
                      height: 70,
                      child: Row(
                        children: [
                          IconButton(
                            icon:Icon(
                                Icons.pets,
                                size: 32,
                                color: Colors.white,
                            ), 
                            onPressed: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => OwnerSignUpScreen(),
                                )
                              );
                            },
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            'Pet Owner',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => ClinicSignUpScreen(),
                        )
                      );
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.only(start: 14),
                      width: double.infinity,
                      color: Colors.green,
                      height: 70,
                      child: Row(
                        children: [
                          IconButton(
                            icon:Icon(
                                Icons.medical_services_outlined,
                                size: 32,
                                color: Colors.white,
                            ), 
                            onPressed: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => ClinicSignUpScreen(),
                                )
                              );
                            },
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            'Clinic Owner',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => StoreSignUpScreen(),
                        )
                      );
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.only(start: 14),
                      width: double.infinity,
                      color: Colors.orange,
                      height: 70,
                      child: Row(
                        children: [
                          IconButton(
                            icon:Icon(
                                Icons.store,
                                size: 32,
                                color: Colors.white,
                            ), 
                            onPressed: (){
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => StoreSignUpScreen(),
                                )
                              );
                            },
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            'Store Owner',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}