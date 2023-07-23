import 'package:easy_localization/easy_localization.dart';

extension DateTimeX on DateTime {
  String get date {
    var formatter = DateFormat('d MMMM yyyy');
    return formatter.format(this);
  }
}