import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String address,
    required String landlord,
    required List<String> images,
    required double price,
    required String location,
    required String description,
  }) = _Item;
}
