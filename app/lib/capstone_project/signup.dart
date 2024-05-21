import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("중마고우")),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                emailInput(),
                const SizedBox(height: 15),
                passwordInput(),
                const SizedBox(height: 15),
                submitButton(),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField emailInput() {
    return TextFormField(
      controller: _emailController,
      autofocus: true,
      validator: (val) {
        if (val!.isEmpty) {
          return 'The input is empty.';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: '이메일을 입력하세요.',
        labelText: '이메일 주소',
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextFormField passwordInput() {
    return TextFormField(
      controller: _pwdController,
      obscureText: true,
      autofocus: true,
      validator: (val) {
        if (val!.isEmpty) {
          return 'The input is empty.';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: '비밀번호를 입력하세요.',
        labelText: '비밀번호',
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  ElevatedButton submitButton() {
    return ElevatedButton(
        onPressed: () async {
          if (_key.currentState!.validate()) {
            try {
              final credential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _pwdController.text,
              )
                  .then((_) => Navigator.pushNamed(context, "/"));
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('비밀번호가 너무 취약합니다.');
              } else if (e.code == 'email-already-in-use') {
                print('해당 이메일에 대한 계정이 이미 존재합니다.');
              }
            } catch (e) {
              print(e.toString());
            }
          }
        },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: const Text(
          "회원가입",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}