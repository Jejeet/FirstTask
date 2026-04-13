import 'package:flutter/material.dart';
import 'OrderScreen.dart';

void main() {
  runApp(const MaterialApp(home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('View Order #ORD-99'),
          onPressed: () {
            // Navigator sends the ID "ORD-99" to the next screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderDetailScreen(orderId: 'ORD-99'),
              ),
            );
          },
        ),
      ),
    );
  }
}

