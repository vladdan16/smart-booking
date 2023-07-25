import 'package:flutter/foundation.dart';
import 'package:frontend/models/models.dart';
import 'package:frontend/repositories/contract_repository.dart';
import 'package:web3dart/credentials.dart';

class EditItemModel extends ChangeNotifier {
  final Item? _item;
  final ContractRepository contractRepository;
  double? price;
  String location;
  String description;
  List<String> imageList;
  EthereumAddress myAddress =
      EthereumAddress.fromHex('0xd23B0836025E53E771cc13B171d189a6d7549Af1');
  Credentials credentials = EthPrivateKey.fromHex(
      '45f0016319b8f2a159ba8ac43f75b10aa7f7e4531a93ddd6c93bf48d42ec0507');

  EditItemModel(Item? item, this.contractRepository)
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
  }) {
    if (_item == null) {
      final item = Item(
        address: 'unknown',
        landlord: myAddress.hex,
        images: imageList,
        price: price,
        location: location,
        description: description,
      );
      contractRepository.createContract(item, credentials);
    } else {
      final item = _item!.copyWith(
        price: price,
        location: location,
        description: description,
        images: imageList,
      );
      contractRepository.editContract(item, credentials);
    }
  }
}
