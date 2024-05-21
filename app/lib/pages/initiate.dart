import 'package:app/capstone_project//home.dart';
import 'package:app/capstone_project//login.dart';
import 'package:app/capstone_project/signup.dart';
import 'package:app/pages/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'home.dart';

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '중마고우',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/': (context) => App(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignupPage(),
        }
    );
  }
}


