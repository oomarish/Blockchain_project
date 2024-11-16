import 'package:flutter/material.dart';
import 'package:frontend/Screens/MunicipalityScreen.dart';

void main() {
  runApp(const MunicipalityApp());
}

class MunicipalityApp extends StatelessWidget {
  const MunicipalityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Municipalityscreen(),
        ]),
      ),
    );
  }
}
