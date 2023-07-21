import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/app.dart';
import 'package:frontend/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  bootstrap(() => const SmartBookingApp());
}
