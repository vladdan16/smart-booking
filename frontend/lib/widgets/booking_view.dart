import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/date_time_extension.dart';
import 'package:frontend/models/models.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key, required this.booking, this.onTap});

  final Booking booking;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              leading: const Icon(Icons.list),
              title: Text(booking.contractAddress),
              subtitle: Text(
                  '${'arrival_date'.tr()}: ${booking.start.date}\n${'departure_date'.tr()}: ${booking.end.date}\n${'amount'.tr()}: ${booking.amount}'),
            ),
          ),
        ),
      ),
    );
  }
}
