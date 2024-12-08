import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class MunicipalityContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://127.0.0.1:7545"; // Ganache RPC URL
  final String _wsUrl = "ws://127.0.0.1:58735/"; // WebSocket URL
  final String _privateKey =
      "0x0637d35fbeede259a4d9f7aeeda1334c7719916df22b2b6e031cdb54f1f8e7f5"; // Private key for the test account

  late Web3Client _client;
  late bool isLoading = false;

  late String _abiCode;
  late EthereumAddress _contractAddress;

  late Credentials _credentials;

  late DeployedContract _contract;
  late ContractFunction _updateHoleState;
  late ContractFunction _createReport;
  late ContractFunction _getReport;

  String? transactionHash; // Store transaction hash for feedback

  var logger = Logger();

  MunicipalityContractLinking() {
    initialSetup();
  }

Future<void> initialSetup() async {
  _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(_wsUrl).cast<String>();
  });

  await getAbi();
  await getCredentials();
  await getDeployedContract();
  listenToEvents(); // Ajouter cette ligne pour commencer à écouter les événements
  isLoading = false;
  notifyListeners();
}


  Future<void> getAbi() async {
    try {
      String abiStringFile =
          await rootBundle.loadString("assets/abi/Municipality.json");
      var jsonAbi = jsonDecode(abiStringFile);

      _abiCode = jsonEncode(jsonAbi["abi"]);
      _contractAddress =
          EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
    } catch (e) {
      logger.e("Error loading ABI file: $e");
    }
  }

  Future<void> getCredentials() async {
    // Create credentials from the private key
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {
    // Load the deployed contract
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Municipality"), _contractAddress);

    // Extract functions
    _updateHoleState = _contract.function("updateHoleState");
    _createReport = _contract.function("createReport");
    _getReport = _contract.function("reports");
  }

  Future<void> updateHoleState(int reportId, int newState) async {
    isLoading = true;
    notifyListeners();

    try {
      // Send transaction to update the state of a report
      final txHash = await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
          contract: _contract,
          function: _updateHoleState,
          parameters: [BigInt.from(reportId), BigInt.from(newState)],
        ),
        chainId: 1337,
      );

      transactionHash = txHash;
      debugPrint("State updated successfully: $txHash");
    } catch (e) {
      debugPrint("Error while updating state: $e");
      transactionHash = null;
    }

    isLoading = false;
    notifyListeners();
  }
  List<Map<String, dynamic>> reports = [];

  Future<void> fetchReports() async {
  isLoading = true;
  notifyListeners();

  try {
    // Appeler la fonction `getAllReportIds` pour obtenir tous les IDs des rapports
    final getAllReportIdsFunction = _contract.function('getAllReportIds');
    final reportIdsResult = await _client.call(
      contract: _contract,
      function: getAllReportIdsFunction,
      params: [],
    );

    // Décoder les IDs des rapports
    List<BigInt> reportIds = List<BigInt>.from(reportIdsResult[0]);

    // Pour chaque ID de rapport, récupérer les détails du rapport
    for (var reportId in reportIds) {
      await _fetchReportDetails(reportId); // Utiliser _fetchReportDetails pour récupérer les détails du rapport
    }

    notifyListeners();
  } catch (e) {
    logger.e("Erreur lors de la récupération des rapports: $e");
  }

  isLoading = false;
  notifyListeners();
}

Future<void> _fetchReportDetails(BigInt reportId) async {
  try {
    // Appeler la fonction `getReport` pour obtenir les détails du rapport
    final getReportFunction = _contract.function('getReport');
    final result = await _client.call(
      contract: _contract,
      function: getReportFunction,
      params: [reportId],
    );

    // Décoder les détails du rapport
    final report = {
      "id": result[0].toInt(),
      "location": result[1],
      "timestamp": DateTime.fromMillisecondsSinceEpoch(result[2].toInt() * 1000),
      "reporter": result[3].toString(),
      "state": result[4].toInt(),
      "stateTimestamp": DateTime.fromMillisecondsSinceEpoch(result[5].toInt() * 1000),
    };

    // Ajouter le rapport à la liste
    reports.add(report);
  } catch (e) {
    logger.e("Erreur lors de la récupération des détails du rapport: $e");
  }
}


  Future<void> listenToEvents() async {
    List<Map<String, dynamic>> reports = [];
    try {
      // Définir le filtre pour écouter les événements "HoleReported"
      final eventFilter = _contract.event('HoleReported');
      _client.events(FilterOptions.events(contract: _contract, event: eventFilter)).listen((event) {
        logger.d("Event received: ${event.topics}");
        final decoded = eventFilter.decodeResults(event.topics!, event.data!);

        // Extraire les détails de l'événement
        final reportId = decoded[0] as BigInt;
        final location = decoded[1] as String;
        final reporter = decoded[2] as EthereumAddress;

        // Ajouter un nouveau rapport à la liste
        final newReport = {
          "id": reportId.toInt(),
          "location": location,
          "timestamp": DateTime.now(),
          "reporter": reporter.hex,
          "state": 0, // État initial
        };

        // Mettre à jour l'état de la liste
        logger.d("New report added: $newReport");
        reports.add(newReport);
        notifyListeners();
      });
    } catch (e) {
      logger.e("Erreur lors de l'écoute des événements : $e");
    }
    
  }


}
