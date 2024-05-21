import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/capstone_project/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext con, AsyncSnapshot<User?> user) {
        if (!user.hasData) {
          return const LoginPage();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text("중마고우"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () async => await FirebaseAuth.instance
                      .signOut()
                      .then((_) => Navigator.pushNamed(context, "/login")),
                ),
              ],
            ),
            body: const Center(
              child: Text("로그인에 성공했습니다!"),
            ),
          );
        }
      },
    );
  }
}
