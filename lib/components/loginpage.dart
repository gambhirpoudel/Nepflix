import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nepflix/components/button.dart';
import 'package:nepflix/components/logintext.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Icon(
              Icons.lock,
              size: 100,
              color: Color(0xFFE50914),
            ),
            const SizedBox(
              height: 50,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Nepflix',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Signin for Access',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            LoginText(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            LoginText(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forget password',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Button(
              onTap: signUserIn,
              text: 'Signin',
            ),
            // const SizedBox(
            //   height: 2,
            // ),
            const Center(
              child: Text(
                "Don't Have Account? SignUp",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
