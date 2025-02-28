import 'package:flutter/material.dart';

class StyledTexted extends StatelessWidget {
  const StyledTexted(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
