import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:frontend/Controllers/citizen_controller.dart'; // Import the controller
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CitizenScreen extends StatelessWidget {
  CitizenScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController coordinatesController = TextEditingController();
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    final citizenContract = Provider.of<CitizenContractLinking>(context);

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
                  _buildTextField(
                    controller: nameController,
                    labelText: 'Nom',
                    hintText: 'Enter your name',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: surnameController,
                    labelText: 'Prenom',
                    hintText: 'Enter your surname',
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  // Use FlutterMap here instead of GoogleMap
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(
                            37.7749, -122.4194), // Default to San Francisco
                        initialZoom: 12.0,
                        onTap: (_, LatLng coordinates) {
                          coordinatesController.text =
                              'Lat: ${coordinates.latitude}, Lng: ${coordinates.longitude}';
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", // OpenStreetMap tiles
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: LatLng(37.7749, -122.4194),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: coordinatesController,
                    labelText: 'Coordonnees',
                    hintText: 'Enter coordinates',
                    isMultiline: true,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.map_outlined),
                      onPressed: () {
                        _showMap(context);
                      },
                    ),
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
              onPressed: () async {
                final coordinates = coordinatesController.text.trim();
                logger.d(coordinates);
                if (coordinates.isNotEmpty) {
                  await citizenContract.reportHole(coordinates);
                  if (citizenContract.transactionHash != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Reported successfully! TxHash: ${citizenContract.transactionHash}",
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Error while reporting hole."),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select a location."),
                    ),
                  );
                }
              },
              child: citizenContract.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Report Hole'),
            ),
          ),
        ],
      ),
    );
  }

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

  // Method to show the map on top of the current screen
  void _showMap(BuildContext context) async {
    final selectedCoordinates = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(),
      ),
    );

    // If coordinates were selected, update the text field
    if (selectedCoordinates != null) {
      coordinatesController.text =
          'Lat: ${selectedCoordinates.latitude}, Lng: ${selectedCoordinates.longitude}';
    }
  }
}

// Map Screen to select the coordinates
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation = LatLng(37.7749, -122.4194); // Default location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Hole Location')),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: _selectedLocation!,
                initialZoom: 12.0,
                onTap: (_, LatLng position) {
                  setState(() {
                    _selectedLocation = position;
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", // OpenStreetMap tiles
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: _selectedLocation != null
                      ? [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: _selectedLocation!,
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ]
                      : [],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_selectedLocation != null) {
                Navigator.pop(context, _selectedLocation);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a location.')),
                );
              }
            },
            child: const Text('Confirm Location'),
          ),
        ],
      ),
    );
  }
}
