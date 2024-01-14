import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nepflix/components/appbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            const CircleAvatar(
              backgroundColor: Color(0xFFE50914),
              radius: 50,
              child: Icon(
                Icons.person,
                size: 90,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Name: XYZ',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${user?.email ?? "No Email"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
