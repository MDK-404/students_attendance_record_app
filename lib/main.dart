
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:students_attendance_app/screens/admin_login.dart';
import 'package:students_attendance_app/screens/home_screen.dart';

import 'package:students_attendance_app/screens/login_screen.dart';
import 'package:students_attendance_app/screens/register_screen.dart';
import 'package:students_attendance_app/screens/user_dashboard.dart';
import 'package:students_attendance_app/utils/color.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCvC-0-hHYHr_DPCqveZwh6yXP1-cdzUCo",
          authDomain: "student-attendance-b4f71.firebaseapp.com",
          projectId: "student-attendance-b4f71",
          storageBucket: "student-attendance-b4f71.appspot.com",
          messagingSenderId: "34028566467",
          appId: "1:34028566467:web:b906aaa3c289c904a0ef76"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return Container(
       //providers
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Student Attendance Record',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return  HomeScreen(

                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'));
                }
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ));
              }
              return  HomeScreen();
            }),
        routes: {
          'home': (context) => HomeScreen(),
          'signup': (context) => SignupScreen(),
          'user login': (context) => Login_Screen(),
          'user_dashboard':(context)=>UserDashBoard(),
          'admin login':(context)=>AdminLoginScreen(),


        },
      ),
    );
  }
}