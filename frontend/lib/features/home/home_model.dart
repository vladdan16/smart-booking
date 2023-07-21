import 'package:flutter/foundation.dart';

class HomeModel extends ChangeNotifier {
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  set selectedPage(int i) {
    _selectedPage = i;
    notifyListeners();
  }

  Future<(Uint8List, String, String)> getItemData(String address) async {
    return (Uint8List(0), ' ', ' ');
  }
}
