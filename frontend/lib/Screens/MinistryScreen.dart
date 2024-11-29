import 'package:flutter/material.dart';

class MinistryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> gouvernorats;
  final bool isDarkMode;
  final Function onThemeToggle;
  final int? selectedGouvernoratIndex;
  final Function(int) onGouvernoratSelect;

  const MinistryScreen({
    super.key,
    required this.gouvernorats,
    required this.isDarkMode,
    required this.onThemeToggle,
    required this.selectedGouvernoratIndex,
    required this.onGouvernoratSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ministry Dashboard'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => onThemeToggle(), // Toggle theme on press
          ),
        ],
      ),
      body: Column(
        children: [
          // Title Section: Increased space between title and navigation bar
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ministry Dashboard',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16), // Increased space
                Text(
                  'Gouvernorats and Municipalities',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),

          // Modern Navigation Bar for Gouvernorats: Centered items
          Container(
            color: isDarkMode ? Colors.grey[900] : Colors.white,
            height: 60.0, // Set a fixed height for the navbar
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center, // Center horizontally
                spacing: 16.0, // Spacing between items
                runSpacing: 8.0, // Spacing between rows if items wrap
                children: List.generate(
                  gouvernorats.length, // Number of items
                  (index) => GestureDetector(
                    onTap: () => onGouvernoratSelect(index), // Handle selection
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: selectedGouvernoratIndex == index
                            ? Colors.white
                            : Colors.blueAccent.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        gouvernorats[index]['name'], // Display gouvernorat name
                        style: TextStyle(
                          color: selectedGouvernoratIndex == index
                              ? Colors.blueAccent
                              : Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Municipalities Grid (Responsive columns based on window width)
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Determine the number of columns based on screen width
                int crossAxisCount = constraints.maxWidth < 800 ? 3 : 4;

                return selectedGouvernoratIndex == null
                    ? const Center(child: Text('Select a Gouvernorat'))
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(
                              8), // Padding around the grid
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                crossAxisCount, // Responsive number of columns
                            crossAxisSpacing:
                                16, // Space between cards horizontally
                            mainAxisSpacing: 16,
                            childAspectRatio:
                                3 / 2, // Space between cards vertically
                          ),
                          itemCount: gouvernorats[selectedGouvernoratIndex!]
                                  ['municipalities']
                              .length,
                          itemBuilder: (context, index) {
                            var municipality =
                                gouvernorats[selectedGouvernoratIndex!]
                                    ['municipalities'][index];
                            return Card(
                              color: isDarkMode
                                  ? Colors.grey[800]
                                  : Colors.pink[50],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image or Icon Placeholder
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(12)),
                                        color: Colors.grey[200],
                                      ),
                                      child: Image.asset(
                                        municipality['image'],
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(Icons.photo,
                                              size: 50, color: Colors.grey);
                                        },
                                      ),
                                    ),
                                  ),
                                  // Municipality Title (aligned to the left)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 4.0), // Reduced padding
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align the text to the left
                                      child: Text(
                                        municipality['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Municipality Address (aligned to the left)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 2.0), // Reduced padding
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align the address to the left
                                      child: Text(
                                        municipality['address'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isDarkMode
                                              ? Colors.white70
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
