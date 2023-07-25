import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:frontend/repositories/BookingService.g.dart';
import 'package:frontend/repositories/contract_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

import 'env/env.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Initialize SharedPreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefs);

  final client = Web3Client(Env.rpcUrl, Client());
  final bookingService = BookingService(
    address: EthereumAddress.fromHex(Env.contractAddress),
    client: client,
  );
  final contractRepository = ContractRepository(bookingService, client);
  GetIt.I.registerSingleton<ContractRepository>(contractRepository);

  runApp(await builder());
}
