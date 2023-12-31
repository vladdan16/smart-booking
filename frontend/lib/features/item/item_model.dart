import 'package:flutter/foundation.dart';
import 'package:frontend/core/creds.dart';
import 'package:frontend/models/booking.dart';

import '../../models/item.dart';

class ItemModel extends ChangeNotifier {
  final Item _item;
  DateTime? _startDate;
  DateTime? _endDate;
  double? amount;

  ItemModel(Item item) : _item = item;

  List<String> get images => _item.images;

  String get description => _item.description;

  String get location => _item.location;

  double get price => _item.price;

  String get address => _item.address;

  DateTime? get startDate => _startDate;

  DateTime? get endDate => _endDate;

  Item get item => _item;

  set startDate(DateTime? date) {
    _startDate = date;
    if (date != null) {
      _calculateAmount();
    } else {
      amount = null;
    }
    notifyListeners();
  }

  set endDate(DateTime? date) {
    _endDate = date;
    if (date != null) {
      _calculateAmount();
    } else {
      amount = null;
    }
    notifyListeners();
  }

  void _calculateAmount() {
    if (_startDate != null && _endDate != null) {
      final days = _endDate!.difference(_startDate!).inDays;
      amount = price * days;
    }
  }

  Booking createBooking() {
    return Booking(
      tenantAddress: Creds.credentials!.address.hex,
      contractAddress: item.address,
      amount: amount!,
      start: _startDate!,
      end: _endDate!,
    );
  }
}
