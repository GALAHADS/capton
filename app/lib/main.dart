import 'package:app/pages/intro.dart';
import 'package:app/provider/service_provider.dart';
import 'package:app/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/capstone_project/home.dart';
import 'package:app/capstone_project/login.dart';
import 'package:app/capstone_project/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<NavigationProvider>(
        create: (context) => NavigationProvider()),
    ChangeNotifierProvider<ServiceProvider>(
        create: (context) => ServiceProvider()),
  ], child: const MyApp()));
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '중마고우',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color(0xff00b5ef),
              selectionColor: Color(0xff00b5ef),
              selectionHandleColor: Colors.black),
          colorScheme: const ColorScheme(
            primary: Colors.white,
            onPrimary: Colors.black,
            background: Colors.white,
            onBackground: Colors.black,
            secondary: Colors.white,
            onSecondary: Colors.white,
            error: Colors.black,
            onError: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
            brightness: Brightness.light,
          ),
        ),
        home: const Intro());
  }
}
