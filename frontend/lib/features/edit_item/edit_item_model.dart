import 'package:flutter/foundation.dart';
import 'package:frontend/models/models.dart';

class EditItemModel extends ChangeNotifier {
  List<String> photoList = [];
  final Item? _item;

  EditItemModel(Item? item) : _item = item;
}
