import 'package:flutter/material.dart';
import 'reusable.dart';

class blueScreen extends StatelessWidget {
  const blueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyCustomCard(title: "White Card", backgroundColor: Colors.white),
    );
  }
}
