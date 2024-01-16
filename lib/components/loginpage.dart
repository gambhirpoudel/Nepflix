import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nepflix/auth/googlesignin.dart';
import 'package:nepflix/components/button.dart';
import 'package:nepflix/components/logintext.dart';
import 'package:nepflix/components/registerpage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      print("Error signing in: $e");
    }
  }

  void goToRegisterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
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
                    'Forget password ?',
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
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () => goToRegisterPage(context),
                child: const Text(
                  "Don't Have Account? SignUp",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Continue with Google',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(width: 30),
            Center(
              child: GestureDetector(
                onTap: () => AuthService().signInWithGoogle(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://media.discordapp.net/attachments/1036120891857305661/1196804263888822322/google_icon_131222.png?ex=65b8f5d4&is=65a680d4&hm=edb8ad34e22a2f184535a1fd14b737c17a51ff2d029efd0889311567a5e277cb&=&format=webp&quality=lossless&width=576&height=576', // Replace with the actual URL of your Google icon image
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
