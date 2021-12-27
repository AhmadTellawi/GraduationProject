import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigapet/clinic_sign_in/sign_in_screen.dart';
import 'package:gigapet/modules/community/community_screen.dart';
import 'package:gigapet/modules/on_boarding/on_boarding_screen.dart';
import 'package:gigapet/modules/profile/owner_profile_screen.dart';
import 'package:gigapet/modules/sign_in/sign_in_screen.dart';
import 'package:gigapet/modules/sign_up/store_sign_up_screen.dart';
import 'package:gigapet/shared/bloc_observer.dart';
import 'package:gigapet/store_sign_in/sign_in_screen.dart';






void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  // DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          color: Colors.white,
          elevation: 0
        )
      ),
      home: ClinicSignInScreen()
    );
  }
}

