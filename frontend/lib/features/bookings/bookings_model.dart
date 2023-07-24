import 'package:flutter/foundation.dart';

import '../../models/models.dart';

class BookingsModel extends ChangeNotifier {
  List<Booking> bookingList = [];
  bool inProgress = true;
  final String address;

  BookingsModel(this.address) {
    init();
  }

  void init() async {
    // TODO: retrieve bookings list by contract address
    bookingList = [
      Booking(
          tenantAddress: '0xaejvbkjrb',
          contractAddress: 'ox09876552',
          start: DateTime.now(),
          end: DateTime(2023, 7, 26),
          amount: 0.0004),
      Booking(
          tenantAddress: '0xaejvbkjrb',
          contractAddress: 'ox09876550',
          start: DateTime(2023, 7, 26),
          end: DateTime(2023, 7, 31),
          amount: 0.0008),
    ];
    inProgress = false;
    notifyListeners();
  }
}