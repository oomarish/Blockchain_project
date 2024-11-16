import 'package:flutter/material.dart';
import 'Screens/CitizenScreen.dart';

void main() {
  runApp(const CitizenApp());
}

class CitizenApp extends StatelessWidget {
  const CitizenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          CitizenScreen(),
        ]),
      ),
    );
  }
}
