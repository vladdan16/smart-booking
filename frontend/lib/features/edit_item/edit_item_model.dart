import 'package:flutter/foundation.dart';
import 'package:frontend/models/models.dart';

class EditItemModel extends ChangeNotifier {
  final Item? _item;
  double? price;
  String location;
  String description;
  List<String> imageList;

  EditItemModel(Item? item)
      : _item = item,
        price = item?.price,
        location = item?.location ?? '',
        description = item?.description ?? '',
        imageList = [...?item?.images];

  void addImage(String image) {
    imageList.add(image);
    notifyListeners();
  }

  void editImage(int index, String? image) {
    if (image == null) {
      imageList.removeAt(index);
    } else {
      imageList[index] = image;
    }
    notifyListeners();
  }

  void saveItem({
    required double price,
    required String location,
    required String description,
  }) {}
}
