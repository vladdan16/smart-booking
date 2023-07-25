import 'package:flutter/foundation.dart';
import 'package:frontend/core/creds.dart';
import 'package:frontend/models/models.dart';
import 'package:frontend/repositories/contract_repository.dart';

class HomeModel extends ChangeNotifier {
  final ContractRepository contractRepository;

  List<Item> itemList = [];
  List<Booking>? bookingsList;
  List<Item>? propertyList;
  bool inProgress = true;
  bool _bookingsInProgress = false;
  bool _profileInProgress = false;
  int _selectedPage = 0;

  HomeModel(this.contractRepository) {
    loadItemList();
  }

  int get selectedPage => _selectedPage;

  bool get bookingsInProgress => _bookingsInProgress;

  bool get profileInProgress => _profileInProgress;

  set bookingsInProgress(bool val) {
    _bookingsInProgress = val;
    notifyListeners();
  }

  set profileInProgress(bool val) {
    _profileInProgress = val;
    notifyListeners();
  }

  set selectedPage(int i) {
    _selectedPage = i;
    notifyListeners();
  }

  Item getItem(String address) {
    return itemList.firstWhere((e) => e.address == address);
  }

  Future<void> loadItemList() async {
    inProgress = true;
    itemList = await contractRepository.getItemList();
    inProgress = false;
    notifyListeners();
  }

  Future<void> loadBookingsList() async {
    bookingsInProgress = true;

    bookingsList =
        await contractRepository.getBookingHistoryByAddress(Creds.credentials!.address);
    bookingsInProgress = false;
    if (propertyList == null) {
      loadPropertyList();
    }
    notifyListeners();
  }

  Future<void> loadPropertyList() async {
    profileInProgress = true;
    propertyList = itemList.where((e) => e.landlord == Creds.credentials!.address.hex).toList();
    profileInProgress = false;
    if (bookingsList == null) {
      loadBookingsList();
    }
    notifyListeners();
  }

  Future<String> bookProperty(String address, Booking booking) async {
    return await contractRepository.bookProperty(address, booking, Creds.credentials!);
  }
}
