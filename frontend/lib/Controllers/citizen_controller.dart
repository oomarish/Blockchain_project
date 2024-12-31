import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class CitizenContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://127.0.0.1:7545"; // Ganache RPC URL
  final String _wsUrl = "ws://127.0.0.1:37801/"; // WebSocket URL
  final String _privateKey =
      "0x81973971d991152811c87d2616b5b1b39812c86eff262f27af747d97d630571b"; // Private key for the test account

  late Web3Client _client;
  late bool isLoading = false;

  late String _abiCode;
  late EthereumAddress _contractAddress;

  late Credentials _credentials;

  late DeployedContract _contract;
  late ContractFunction _reportHole;

  String? transactionHash; // Store transaction hash for feedback

  var logger = Logger();

  CitizenContractLinking() {
    initialSetup();
  }

  initialSetup() async {
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    await getAbi();
    await getCredentials();
    await getDeployedContract();
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
    // Create credentials from the private key
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {
    // Load the deployed contract
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Manager"), _contractAddress);

    // Extract the `reportHole` function
    _reportHole = _contract.function("reportHole");
  }

  Future<void> reportHole(String coordinates) async {
    isLoading = true;
    notifyListeners();

    try {
      // Send transaction to call `reportHole` with the given coordinates
      final txHash = await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
          contract: _contract,
          function: _reportHole,
          parameters: [coordinates],
        ),
        chainId: 1337, // Ganache default chain ID
      );

      transactionHash = txHash;
      debugPrint("Transaction successful: $txHash");
    } catch (e) {
      debugPrint("Error while reporting hole: $e");
      transactionHash = null;
    }

    isLoading = false;
    notifyListeners();
  }
}
