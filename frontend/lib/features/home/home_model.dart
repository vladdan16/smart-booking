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
      Item(address: "ox09876543", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876544", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876545", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876546", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876547", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876548", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876549", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876550", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876551", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
      Item(address: "ox09876552", price: 0.0002, location: "Innopolis, Sportivnaya st", description: "## Description"),
    ];
  }
}
