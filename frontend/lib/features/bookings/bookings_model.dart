import 'package:flutter/foundation.dart';
import 'package:frontend/repositories/contract_repository.dart';
import 'package:web3dart/credentials.dart';

import '../../models/models.dart';

class BookingsModel extends ChangeNotifier {
  List<Booking> bookingList = [];
  bool inProgress = true;
  final String address;
  final ContractRepository contractRepository;
  EthereumAddress myAddress =
      EthereumAddress.fromHex('0xd23B0836025E53E771cc13B171d189a6d7549Af1');
  Credentials credentials = EthPrivateKey.fromHex(
      '45f0016319b8f2a159ba8ac43f75b10aa7f7e4531a93ddd6c93bf48d42ec0507');

  BookingsModel(this.address, this.contractRepository) {
    init();
  }

  void init() async {
    bookingList = await contractRepository.getAllOwnerBookings(address);
    inProgress = false;
    notifyListeners();
  }
}
