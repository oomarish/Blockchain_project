import 'package:flutter/material.dart';

class MunicipalityScreen extends StatelessWidget {
  final String municipalityName;
  final String address;
  final List<Map<String, dynamic>> holesData;

  const MunicipalityScreen({
    super.key,
    this.municipalityName = 'Municipality 1',
    this.address = 'Adresse',
    this.holesData = const [
      {
        'title': 'Pothole 1',
        'subtitle': 'Details about Pothole 1',
        'status': 'Pending'
      },
      {
        'title': 'Pothole 2',
        'subtitle': 'Details about Pothole 2',
        'status': 'In Progress'
      },
      {
        'title': 'Pothole 3',
        'subtitle': 'Details about Pothole 3',
        'status': 'Resolved'
      },
    ],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: theme.iconTheme.color),
          onPressed: () {},
        ),
        title: Text(
          'Municipality Dashboard',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.textTheme.bodyLarge?.color ?? theme.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Address
            Center(
              child: Column(
                children: [
                  Text(
                    municipalityName,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    address,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Holes List
            Expanded(
              child: ListView.builder(
                itemCount: holesData.length,
                itemBuilder: (context, index) {
                  final hole = holesData[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: isDarkMode ? Colors.grey[800] : Colors.pink[50],
                    child: ListTile(
                      leading: Icon(Icons.circle_notifications,
                          color: theme.iconTheme.color),
                      title: Text(
                        hole['title'] ?? 'Pothole',
                        style: theme.textTheme.bodyMedium,
                      ),
                      subtitle: Text(
                        hole['subtitle'] ?? 'Details about this hole',
                        style: theme.textTheme.bodyLarge,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            hole['status'] ?? 'Unknown',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: hole['status'] == 'Resolved'
                                  ? Colors.green
                                  : hole['status'] == 'In Progress'
                                      ? Colors.orange
                                      : Colors.red,
                            ),
                          ),
                          const Icon(Icons.check_box_outline_blank,
                              color: Colors.blue),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
