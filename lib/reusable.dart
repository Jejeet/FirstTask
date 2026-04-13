import 'package:flutter/material.dart';

class MyCustomCard extends StatelessWidget {
  final String title;
  final Color backgroundColor; // 1. Define the parameter

  const MyCustomCard({
    super.key, 
    required this.title, 
    required this.backgroundColor, // 2. Add it to the constructor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor, // 3. Use the parameter here
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(title),
      ),
    );
  }
}

