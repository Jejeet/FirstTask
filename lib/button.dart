import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  // 1. Define your cart list and item here
  List<String> cartItems = []; 
  String newItem = "New Product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Count: ${cartItems.length}")),
      body: Center(
        child: TextButton(
          
          onPressed: () {
            // 2. Wrap the change in setState so Flutter knows to rebuild the UI without it, it won't update
            setState(() {
              cartItems.add(newItem); 
            });
            print("Items in cart: ${cartItems.length}");
          },
          // 3. Add a label so the button is visible
          child: const Text("Add to Cart"),
        ),
      ),
    );
  }
}
