import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:frontend/core/creds.dart';
import 'package:frontend/core/date_time_extension.dart';
import 'package:frontend/core/dialogs.dart';
import 'package:frontend/features/home/home.dart';
import 'package:frontend/features/item/item.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/credentials.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hPadding = MediaQuery.of(context).size.width > 700
        ? MediaQuery.of(context).size.width * 0.15
        : 10.0;
    final startDate = context.watch<ItemModel>().startDate;
    final sDate = startDate != null ? startDate.date : "not_specified".tr();
    final endDate = context.watch<ItemModel>().endDate;
    final dDate = endDate != null ? endDate.date : "not_specified".tr();
    final amount = context.watch<ItemModel>().amount;
    final sAmount = amount != null ? amount.toString() : "choose_dates".tr();
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
          SliverToBoxAdapter(
            child: ImageCarousel(
              imgList: context.read<ItemModel>().images,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${'price'.tr()}: ${context.read<ItemModel>().price} ETH',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    '${'address'.tr()}: ${context.read<ItemModel>().location}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  // const SizedBox(height: 10),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: MarkdownBody(
                              data: context.read<ItemModel>().description,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              '${'arrival_date'.tr()}: $sDate',
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                chooseDate(
                                  context,
                                  initialDate: startDate,
                                ).then((date) {
                                  context.read<ItemModel>().startDate = date;
                                });
                              },
                              child: const Text('choose_date').tr(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: <Widget>[
                            Text(
                              '${'departure_date'.tr()}: $dDate',
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                chooseDate(
                                  context,
                                  firstDate: startDate,
                                  initialDate: endDate,
                                ).then((date) {
                                  context.read<ItemModel>().endDate = date;
                                });
                              },
                              child: const Text('choose_date').tr(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '${'amount'.tr()}: $sAmount',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 15),
                        FilledButton(
                          onPressed: amount == null
                              ? null
                              : () async {
                                  if (Creds.credentials == null) {
                                    final res = await showLoginDialog(context);
                                    if (res == null ||
                                        Creds.setCredentials(res)) {
                                      return;
                                    }
                                  }
                                  final item = context.read<ItemModel>().item;
                                  final booking =
                                      context.read<ItemModel>().createBooking();
                                  final res = await context
                                      .read<HomeModel>()
                                      .bookProperty(
                                        item.address,
                                        booking,
                                      );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Successfully booked property. Here is transaction hash: $res'),
                                    ),
                                  );
                                  context.go('/');
                                },
                          child: const Text('book_property').tr(),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime?> chooseDate(BuildContext context,
      {DateTime? firstDate, DateTime? initialDate}) async {
    final currentDate = firstDate != null
        ? firstDate.add(const Duration(days: 1))
        : DateTime.now();
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? currentDate,
      firstDate: currentDate,
      lastDate: currentDate.add(const Duration(days: 365)),
    );
  }
}
