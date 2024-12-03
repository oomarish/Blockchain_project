import 'package:flutter/material.dart';

class CitizenScreen extends StatelessWidget {
  CitizenScreen({super.key});

  // Controllers to capture form input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController coordinatesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header with icons
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.flag, size: 40),
                  SizedBox(height: 4),
                  Text(
                    'Hofra',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Signalisation',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              Icon(Icons.warning_amber_outlined, size: 40),
            ],
          ),
          const SizedBox(height: 24),
          // Form fields
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Name Field
                  _buildTextField(
                    controller: nameController,
                    labelText: 'Nom',
                    hintText: 'Enter your name',
                  ),
                  const SizedBox(height: 16),
                  // Surname Field
                  _buildTextField(
                    controller: surnameController,
                    labelText: 'Prenom',
                    hintText: 'Enter your surname',
                  ),
                  const SizedBox(height: 16),
                  // Email Field
                  _buildTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  // Coordinates Field
                  _buildTextField(
                    controller: coordinatesController,
                    labelText: 'Coordonnees',
                    hintText: 'Enter coordinates',
                    isMultiline: true,
                    suffixIcon: const Icon(Icons.map_outlined),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Submit logic here
                print("Form submitted");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Button color
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Signaler',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Utility method to build text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? hintText,
    bool isMultiline = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: isMultiline ? 3 : 1,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
      ),
    );
  }
}
