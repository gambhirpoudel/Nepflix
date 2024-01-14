import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback? onTap;
  // ignore: prefer_typing_uninitialized_variables
  final text;
  const Button({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Color(0xFFE50914),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
