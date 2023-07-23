import 'package:flutter/foundation.dart';
import 'package:frontend/models/models.dart';

class HomeModel extends ChangeNotifier {
  List<Item> itemList = [];
  List<Booking>? bookingsList;
  List<Item>? propertyList;
  bool _bookingsInProgress = false;
  bool _profileInProgress = false;
  int _selectedPage = 0;
  String? _address;

  int get selectedPage => _selectedPage;
  bool get bookingsInProgress => _bookingsInProgress;
  bool get profileInProgress => _profileInProgress;
  String? get address => _address;

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

  set address(String? s) {
    _address = s;
    notifyListeners();
  }

  Item getItem(String address) {
    return itemList.firstWhere((e) => e.address == address);
  }

  Future<void> loadItemList() async {
    // TODO: retrieve items from blockchain
    itemList = <Item>[
      const Item(
          address: "ox09876543",
          landlord: '0x3',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876544",
          landlord: '0x1',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876545",
          landlord: '0x1',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876546",
          landlord: '0x1',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876547",
          landlord: '0x1',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876548",
          landlord: '0x2',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876549",
          landlord: '0x2',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876550",
          landlord: '0x2',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876551",
          landlord: '0x2',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876552",
          landlord: '0x2',
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
    ];
  }

  Future<void> loadBookingsList() async {
    // TODO: load bookings from blockchain
    bookingsInProgress = true;
    bookingsList = [
      Booking(tenantAddress: '0xaejvbkjrb', contractAddress: 'ox09876552', start: DateTime.now(), end: DateTime(2023, 7, 26), amount: 0.0004),
      Booking(tenantAddress: '0xaejvbkjrb', contractAddress: 'ox09876550', start: DateTime(2023, 7, 26), end: DateTime(2023, 7, 31), amount: 0.0008),
    ];
    bookingsInProgress = false;
  }

  Future<void> loadPropertyList() async {
    profileInProgress = true;
    propertyList = itemList.where((e) => e.landlord == _address).toList();
    profileInProgress = false;
  }
}
