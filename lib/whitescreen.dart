import 'package:flutter/material.dart';
import 'reusable.dart';
class Whitescreen extends StatelessWidget {
  const Whitescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomCard(title: "White Card", backgroundColor: Colors.white),
    );
  }
}
