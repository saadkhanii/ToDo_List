import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String btnName;
  VoidCallback onPressed;

  MyButtons({super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
        child: Text(btnName),),
    );
  }
}
