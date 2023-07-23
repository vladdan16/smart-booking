import 'package:flutter/foundation.dart';
import 'package:frontend/models/models.dart';

class HomeModel extends ChangeNotifier {
  List<Item> itemList = [];
  List<Booking>? bookingsList;
  bool _bookingsInProgress = false;
  int _selectedPage = 0;
  String? _address;

  int get selectedPage => _selectedPage;
  bool get bookingsInProgress => _bookingsInProgress;

  set bookingsInProgress(bool val) {
    _bookingsInProgress = val;
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
    // TODO: retrieve items from blockchain
    itemList = <Item>[
      const Item(
          address: "ox09876543",
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876544",
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876545",
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876546",
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876547",
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876548",
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876549",
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876550",
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876551",
          images: ['https://i.imgur.com/OuiwcF0.png'],
          price: 0.0002,
          location: "Innopolis, Sportivnaya st",
          description: "## Description"),
      const Item(
          address: "ox09876552",
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
}
