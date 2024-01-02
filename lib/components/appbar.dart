import 'package:flutter/material.dart';
import 'package:nepflix/utils/fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
