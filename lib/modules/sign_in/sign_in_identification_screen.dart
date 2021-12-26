import 'package:flutter/material.dart';
import 'package:gigapet/clinic_layout/layout/gigapet/clinic_layout.dart';
import 'package:gigapet/clinic_sign_in/sign_in_screen.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';
import 'package:gigapet/modules/sign_up/clinic_sign_up.dart';
import 'package:gigapet/modules/sign_up/owner_sign_up_screen.dart';
import 'package:gigapet/modules/sign_up/store_sign_up_screen.dart';
import 'package:gigapet/store_layout/layout/gigapet/store_layout.dart';
import 'package:gigapet/store_sign_in/sign_in_screen.dart';

class Sign_In_Identification_Screen extends StatelessWidget {
  const Sign_In_Identification_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Would you like',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'to Sign in as',
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
                          builder: (context) => SignInScreen(),
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
                                  builder: (context) => SignInScreen(),
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
                          builder: (context) => ClinicSignInScreen(),
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
                                  builder: (context) => ClinicSignInScreen(),
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
                          builder: (context) => StoreSignInScreen(),
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
                                  builder: (context) => StoreLayout(),
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