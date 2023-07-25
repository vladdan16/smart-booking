// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'RPC_URL', obfuscate: true)
  static final String rpcUrl = _Env.rpcUrl;

  @EnviedField(varName: 'CONTRACT_ADDRESS', obfuscate: true)
  static final String contractAddress = _Env.contractAddress;
}
