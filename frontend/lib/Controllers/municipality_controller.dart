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
      "0x81973971d991152811c87d2616b5b1b39812c86eff262f27af747d97d630571b"; // Private key for the test account

  late Web3Client _client;
  late bool isLoading = false;

  late String _abiCode;
  late EthereumAddress _contractAddress;

  late Credentials _credentials;

  late DeployedContract _contract;
  late ContractFunction _updateHoleState;
  late ContractFunction _getAllReports;
  late ContractEvent _holeReportedEvent;

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
    listenToEvents();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getAbi() async {
    try {
      String abiStringFile =
          await rootBundle.loadString("assets/abi/Manager.json");
      var jsonAbi = jsonDecode(abiStringFile);

      _abiCode = jsonEncode(jsonAbi["abi"]);
      _contractAddress =
          EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
    } catch (e) {
      logger.e("Error loading ABI file: $e");
    }
  }

  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Manager"), _contractAddress);

    _updateHoleState = _contract.function("updateHoleState");
    _getAllReports = _contract.function("getAllHoles");
    _holeReportedEvent = _contract.event("HoleReported");
  }

  List<Map<String, dynamic>> reports = [];

  Future<void> fetchReports() async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await _client.call(
        contract: _contract,
        function: _getAllReports,
        params: [],
      );

      reports = result.map((reportData) {
        final data = reportData as List<dynamic>;
        return {
          "id": data[0].toInt(),
          "location": data[1],
          "timestamp":
              DateTime.fromMillisecondsSinceEpoch(data[2].toInt() * 1000),
          "reporter": data[3],
          "state": data[4],
        };
      }).toList();

      logger.i("Fetched reports: $reports");
    } catch (e) {
      logger.e("Error fetching reports: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateHoleState(int reportId, int newState) async {
    isLoading = true;
    notifyListeners();

    try {
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
      logger.i("State updated successfully: $txHash");
    } catch (e) {
      logger.e("Error while updating state: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> listenToEvents() async {
    try {
      _client
          .events(FilterOptions.events(
              contract: _contract, event: _holeReportedEvent))
          .listen((event) {
        final decoded =
            _holeReportedEvent.decodeResults(event.topics!, event.data!);
        final newReport = {
          "id": decoded[0].toInt(),
          "location": decoded[1],
          "timestamp": DateTime.now(),
          "reporter": decoded[3],
          "state": 0,
        };

        reports.add(newReport);
        notifyListeners();
        logger.i("New report received: $newReport");
      });
    } catch (e) {
      logger.e("Error listening to events: $e");
    }
  }
}
