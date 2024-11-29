import 'package:flutter/material.dart';
import 'package:frontend/Screens/MinistryScreen.dart'; // Import your MinistryScreen

void main() {
  runApp(const MinistryApp());
}

class MinistryApp extends StatefulWidget {
  const MinistryApp({super.key});

  @override
  State<MinistryApp> createState() => _MinistryAppState();
}

class _MinistryAppState extends State<MinistryApp> {
  bool isDarkMode = false; // Start with dark mode by default
  int? selectedGouvernoratIndex; // Track selected Gouvernorat

  // List of Gouvernorats and Municipalities (just an example)
  final List<Map<String, dynamic>> gouvernorats = [
    {
      'name': 'Sfax',
      'municipalities': [
        {
          'title': 'Gremda',
          'address': 'Rte gremda km 6.5',
          'image': 'assets/municipality_a.jpg'
        },
        {
          'title': 'L\'Ain',
          'address': 'Rte Ain km 6',
          'image': 'assets/municipality_b.jpg'
        },
        {
          'title': 'Hay lahbib',
          'address': 'Rte Soukra km 4',
          'image': 'assets/municipality_b.jpg'
        },
      ]
    },
    {
      'name': 'Tunis',
      'municipalities': [
        {
          'title': 'Ben Arous',
          'address': 'Rte Ben Arous',
          'image': 'assets/municipality_c.jpg'
        },
        {
          'title': 'Ariana',
          'address': 'Rte Ariana',
          'image': 'assets/municipality_d.jpg'
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ), // Dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Dynamic theme
      home: MinistryScreen(
        gouvernorats: gouvernorats,
        isDarkMode: isDarkMode,
        onThemeToggle: () {
          setState(() {
            isDarkMode = !isDarkMode; // Toggle theme mode
          });
        },
        selectedGouvernoratIndex: selectedGouvernoratIndex,
        onGouvernoratSelect: (index) {
          setState(() {
            selectedGouvernoratIndex = index;
          });
        },
      ),
    );
  }
}
