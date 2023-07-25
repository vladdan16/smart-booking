import 'dart:convert';
import 'dart:math' as math;

import 'package:frontend/models/models.dart';
import 'package:frontend/repositories/BookingService.g.dart';
import 'package:frontend/repositories/RentalContract.g.dart';
import 'package:web3dart/web3dart.dart';

class ContractRepository {
  final BookingService bookingService;
  final Web3Client client;
  List<EthereumAddress> allAddresses = [];
  List<RentalContract> allContracts = [];
  List<Item> allItems = [];
  List<EthereumAddress> ownerAddresses = [];
  List<RentalContract> ownerContracts = [];
  List<Item> ownerItems = [];

  ContractRepository(this.bookingService, this.client);

  Future<List<Item>> getItemList() async {
    allAddresses = await bookingService.getAllProperties();
    allContracts = [];
    allItems = [];
    for (final address in allAddresses) {
      final contract = RentalContract(
        address: address,
        client: client,
      );
      allContracts.add(contract);
      final meta = await contract.propertyMetadata();
      var item = Item.fromJson(jsonDecode(meta));
      item = item.copyWith(address: address.hex);
      allItems.add(item);
    }

    return allItems;
  }

  Future<List<Item>> getOwnerItemList(EthereumAddress owner) async {
    ownerAddresses = await bookingService.getPropertiesByOwner(owner);
    ownerContracts = [];
    ownerItems = [];
    for (final address in ownerAddresses) {
      final contract = RentalContract(
        address: address,
        client: client,
      );
      ownerContracts.add(contract);
      final meta = await contract.propertyMetadata();
      final item = Item.fromJson(jsonDecode(meta)).copyWith(address: address.hex);
      ownerItems.add(item);
    }

    return ownerItems;
  }

  Future<List<Booking>> getBookingHistoryByAddress(
      EthereumAddress address) async {
    final List<dynamic> tenantBookingsRaw =
        await bookingService.getTenantHistory(address);
    List<Booking> tenantBookings = [];
    for (var tenantBookingRaw in tenantBookingsRaw) {
      DateTime start = DateTime.fromMillisecondsSinceEpoch(
          (tenantBookingRaw[1][1] as BigInt).toInt() * 1000);
      DateTime end = DateTime.fromMillisecondsSinceEpoch(
          (tenantBookingRaw[1][2] as BigInt).toInt() * 1000);

      Booking booking = Booking(
        tenantAddress: tenantBookingRaw[1][0].toString(),
        contractAddress: tenantBookingRaw[0].toString(),
        amount: weiToEther(tenantBookingRaw[1][3] as BigInt),
        start: start,
        end: end,
      );

      tenantBookings.add(booking);
    }
    return tenantBookings;
  }

  Future<List<Booking>> getAllOwnerBookings(String address) async {
    final index = ownerItems.indexWhere((e) => e.address == address);
    final rentalContract = ownerContracts[index];
    final bookingsList = await rentalContract.getAllBookings();
    return bookingsList.map((booking) {
      return Booking(
        tenantAddress: booking[0],
        contractAddress: booking[1],
        amount: weiToEther(booking[2]),
        start: DateTime.fromMillisecondsSinceEpoch(
            int.parse(booking[3].toString()) * 1000),
        end: DateTime.fromMillisecondsSinceEpoch(
            int.parse(booking[4].toString()) * 1000),
      );
    }).toList();
  }

  Future<void> editContract(
    Item item,
    Credentials credentials,
  ) async {
    await getOwnerItemList(credentials.address);
    final index = ownerItems.indexWhere((e) => e.address == item.address);
    final rentalContract = ownerContracts[index];
    final meta = jsonEncode(item.toJson());
    await rentalContract.editContract(
      etherToWei(item.price),
      meta,
      credentials: credentials,
    );
  }

  Future<void> createContract(Item item, Credentials credentials) async {
    final meta = jsonEncode(item.toJson());
    print(meta);
    print(credentials.address.hex);
    await bookingService.addProperty(
      meta,
      etherToWei(item.price),
      credentials: credentials,
    );
  }

  Future<String> bookProperty(
      String address, Booking booking, Credentials credentials) async {
    final index = allItems.indexWhere((e) => e.address == address);
    final rentalContract = allContracts[index];
    print(booking.start.millisecondsSinceEpoch);
    print(booking.end.millisecondsSinceEpoch);
    final transaction = Transaction.callContract(
      contract: rentalContract.self,
      function: rentalContract.self.abi.functions[1],
      parameters: [
        BigInt.from(booking.start.millisecondsSinceEpoch),
        BigInt.from(booking.end.millisecondsSinceEpoch),
      ],
      maxGas: 100000,
      gasPrice: EtherAmount.inWei(BigInt.one),
      value: EtherAmount.fromBigInt(
          EtherUnit.wei, etherToWei(booking.amount + 0.002)), // amount in Wei
    );
    final res = await rentalContract.bookProperty(
      BigInt.from(booking.start.millisecondsSinceEpoch),
      BigInt.from(booking.end.millisecondsSinceEpoch),
      credentials: credentials,
      transaction: transaction,
    );
    return res;
  }

  BigInt etherToWei(double ether) {
    return BigInt.from(ether * math.pow(10, 18));
  }

  double weiToEther(BigInt wei) {
    return (wei / BigInt.from(math.pow(10, 18))).toDouble();
  }
}
