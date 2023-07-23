import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String tenantAddress,
    required String contractAddress,
    required double amount,
    required DateTime start,
    required DateTime end,
  }) = _Booking;
}
