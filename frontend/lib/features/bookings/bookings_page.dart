import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/bookings/bookings.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hPadding = MediaQuery.of(context).size.width > 700
        ? MediaQuery.of(context).size.width * 0.1
        : 10.0;
    final list = context.read<BookingsModel>().bookingList;
    final inProgress = context.watch<BookingsModel>().inProgress;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/'),
            ),
            title: const Text('smart_booking').tr(),
          ),
          if (inProgress)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator(),),
            ),
          if (!inProgress)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              sliver: SliverMainAxisGroup(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        'your_tenants',
                        style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.fontSize,
                        ),
                      ).tr(),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 10,
                    ),
                    sliver: SliverList.list(
                      children: List.generate(
                        list.length,
                        (index) {
                          return BookingView(
                            booking: list[index],
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
