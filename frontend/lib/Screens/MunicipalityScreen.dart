import 'package:flutter/material.dart';
import 'package:frontend/Controllers/municipality_controller.dart';
import 'package:logger/logger.dart';

class MunicipalityScreen extends StatefulWidget {
  const MunicipalityScreen({super.key});

  @override
  _MunicipalityScreenState createState() => _MunicipalityScreenState();
}

class _MunicipalityScreenState extends State<MunicipalityScreen> {
  late MunicipalityContractLinking municipalityController;
  late Future<void> _initializationFuture;

   var logger = Logger();
  @override
  void initState() {
    super.initState();
    
    // Initialisation du contrôleur
    municipalityController = MunicipalityContractLinking();
    
    // Appeler initialSetup pour préparer la connexion au contrat
    _initializationFuture = municipalityController.initialSetup();

    // Appeler fetchReports après l'initialisation
    _initializationFuture.then((_) {
      municipalityController.fetchReports(); // Appeler fetchReports une fois l'initialisation terminée
    }).catchError((e) {
      logger.e("Erreur lors de l'initialisation: $e");
    });
  }


@override
Widget build(BuildContext context) {
  return AnimatedBuilder(
    animation: municipalityController,
    builder: (context, _) {
      if (municipalityController.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      final reports = municipalityController.reports;

      if (reports.isEmpty) {
        return const Center(child: Text("Aucun trou signalé pour l'instant."));
      }

      return ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          var report = reports[index];

          return ListTile(
            title: Text(report['location']),
            subtitle: Text(
                "Signalé par: ${report['reporter']}\nÉtat: ${report['state']}"),
            trailing: IconButton(
              icon: const Icon(Icons.update),
              onPressed: () {
                municipalityController.updateHoleState(
                  report['id'],
                  (report['state'] + 1) % 3,
                );
              },
            ),
          );
        },
      );
    },
  );
}

}
