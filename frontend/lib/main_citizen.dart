import 'package:flutter/material.dart';
import 'package:frontend/Screens/CitizenScreen.dart';
import 'package:provider/provider.dart';
import 'Controllers/citizen_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CitizenContractLinking(),
        ),
      ],
      child: CitizenApp(),
    ),
  );
}

class CitizenApp extends StatefulWidget {
  const CitizenApp({super.key});

  @override
  State<CitizenApp> createState() => _CitizenAppState();
}

class _CitizenAppState extends State<CitizenApp> {
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
          title: const Text('Citizen App'),
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
        body: SizedBox.expand(
          child: CitizenScreen(),
        ),
      ),
    );
  }
}
