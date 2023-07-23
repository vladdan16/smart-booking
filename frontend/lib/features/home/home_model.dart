import 'package:flutter/foundation.dart';
import 'package:frontend/models/item.dart';

class HomeModel extends ChangeNotifier {
  List<Item> itemList = [];
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  set selectedPage(int i) {
    _selectedPage = i;
    notifyListeners();
  }

  Item getItem(String address){
    return itemList.firstWhere((e) => e.address == address);
  }

  Future<void> loadItemList() async {
    itemList = <Item>[
      Item(address: "ox09876543", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876544", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876545", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876546", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876547", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876548", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876549", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876550", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876551", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876552", images: ['https://i.imgur.com/OuiwcF0.png'], price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
    ];
  }
}
