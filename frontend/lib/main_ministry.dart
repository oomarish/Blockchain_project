import 'package:flutter/material.dart';
import 'Screens/MinistryScreen.dart';

void main() {
  runApp(const MinistryApp());
}

class MinistryApp extends StatelessWidget {
  const MinistryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          MinistryScreen(),
        ]),
      ),
    );
  }
}
