import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nepflix/utils/fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ModifiedText(
        text: title,
        size: 30,
        color: const Color(0xFFDAFFFB),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFFE50914),
      actions: [
        IconButton(
          onPressed: signUserOut,
          icon: const Icon(Icons.logout),
          iconSize: 30,
          color: const Color(0xFFDAFFFB),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
