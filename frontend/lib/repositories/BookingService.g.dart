// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[{"internalType":"string","name":"metadataURI","type":"string"},{"internalType":"uint256","name":"rent","type":"uint256"}],"name":"addProperty","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getAllProperties","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"getPropertiesByOwner","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"tenant","type":"address"}],"name":"getTenantHistory","outputs":[{"components":[{"internalType":"address","name":"propertyAddress","type":"address"},{"components":[{"internalType":"address","name":"tenant","type":"address"},{"internalType":"uint256","name":"start","type":"uint256"},{"internalType":"uint256","name":"end","type":"uint256"},{"internalType":"uint256","name":"amount","type":"uint256"}],"internalType":"struct RentalContract.Booking","name":"booking","type":"tuple"}],"internalType":"struct BookingService.TenantBooking[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"}],"name":"ownerProperties","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"properties","outputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"contract RentalContract","name":"rentalContract","type":"address"}],"stateMutability":"view","type":"function"}]',
  'BookingService',
);

class BookingService extends _i1.GeneratedContract {
  BookingService({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addProperty(
    String metadataURI,
    BigInt rent, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[0];
    assert(checkSignature(function, 'f54e1aef'));
    final params = [
      metadataURI,
      rent,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getAllProperties(
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '3d51402c'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getPropertiesByOwner(
    _i1.EthereumAddress owner, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '9fcb2748'));
    final params = [owner];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getTenantHistory(
    _i1.EthereumAddress tenant, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '21c98013'));
    final params = [tenant];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> ownerProperties(
    _i1.EthereumAddress $param4,
    BigInt $param5, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '8f48bd5b'));
    final params = [
      $param4,
      $param5,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<Properties> properties(
    BigInt $param6, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, 'f7b10808'));
    final params = [$param6];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return Properties(response);
  }
}

class Properties {
  Properties(List<dynamic> response)
      : owner = (response[0] as _i1.EthereumAddress),
        rentalContract = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress owner;

  final _i1.EthereumAddress rentalContract;
}
