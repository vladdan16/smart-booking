import 'package:web3dart/credentials.dart';

class Creds {
  static Credentials? credentials;

  static bool setCredentials(String hex) {
    try {
      credentials = EthPrivateKey.fromHex(hex);
      return true;
    } catch (_) {
      return false;
    }
  }
}