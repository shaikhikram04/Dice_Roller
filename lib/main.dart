import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Color.fromRGBO(16, 4, 62, 1),
            Color.fromRGBO(47, 13, 106, 1),
          ],
        ),
      ),
    ),
  );
}
