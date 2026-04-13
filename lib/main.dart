

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Added 'ColorScheme' here to fix the syntax error
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fast List Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
// body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: 
//          SingleChildScrollView(
//   child: Column(
//     children: List.generate(100, (index) => MyItemWidget(index)),
//   ),
// ),
      
      // CHANGED: Replaced SingleChildScrollView + Column with ListView.builder
      // This only renders items visible on screen, making it instant.
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return MyItemWidget(index);
        },
      ),
    );
  }
}

// NEW: Defined the missing widget class here
class MyItemWidget extends StatelessWidget {
  final int index;
  const MyItemWidget(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text('${index + 1}')),
      title: Text('Item Number $index'),
      subtitle: const Text('This loads lazily and stays fast!'),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

