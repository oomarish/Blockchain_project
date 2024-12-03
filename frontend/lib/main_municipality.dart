import 'package:flutter/material.dart';
import 'package:frontend/Screens/MunicipalityScreen.dart';

void main() {
  runApp(const MunicipalityApp());
}

class MunicipalityApp extends StatefulWidget {
  const MunicipalityApp({super.key});

  @override
  State<MunicipalityApp> createState() => _MunicipalityAppState();
}

class _MunicipalityAppState extends State<MunicipalityApp> {
  bool isDarkMode = true; // Start with dark mode by default

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ), // Dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Dynamic theme
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Municipality App'),
          actions: [
            IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode; // Toggle theme mode
                });
              },
            ),
          ],
        ),
        body: const SizedBox.expand(
          child: MunicipalityScreen(),
        ),
      ),
    );
  }
}
