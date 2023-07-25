import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/creds.dart';
import 'package:frontend/core/dialogs.dart';
import 'package:frontend/features/home/home.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedPage = context.watch<HomeModel>().selectedPage;
    final creds = Creds.credentials;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('smart_booking').tr(),
            pinned: true,
          ),
          Builder(
            builder: (context) {
              switch (selectedPage) {
                case 0:
                  return _HomeContent();
                case 1:
                  return _BookingsView();
                case 2:
                  return _ProfileView();
                default:
                  throw Exception("Unknown index");
              }
            },
          ),
        ],
      ),
      floatingActionButton: selectedPage == 2 && creds != null
          ? FloatingActionButton(
              onPressed: () {
                context.go('/edit_item/new');
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          context.read<HomeModel>().selectedPage = index;
        },
        selectedIndex: selectedPage,
        destinations: <Widget>[
          NavigationDestination(
            icon: const Icon(Icons.explore),
            label: "explore".tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.menu),
            label: "my_bookings".tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.holiday_village),
            label: "my_properties".tr(),
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hPadding = MediaQuery.of(context).size.width > 700
        ? MediaQuery.of(context).size.width * 0.1
        : 10.0;
    final inProgress = context.watch<HomeModel>().inProgress;
    final list = context.watch<HomeModel>().itemList;

    if (inProgress) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      sliver: SliverMainAxisGroup(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'places_for_rent',
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium?.fontSize,
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
                (i) => ItemView(
                  address: list[i].address,
                  onTap: () => context.go('/item/${list[i].address}'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inProgress = context.watch<HomeModel>().bookingsInProgress;
    final creds = Creds.credentials;
    final list = context.watch<HomeModel>().bookingsList;
    if (creds == null && !inProgress) {
      return SliverFillRemaining(
        child: Center(
          child: ElevatedButton(
            child: const Text('login').tr(),
            onPressed: () async {
              final res = await showLoginDialog(context);
              if (context.mounted && res != null && Creds.setCredentials(res)) {
                await context.read<HomeModel>().loadBookingsList();
              }
            },
          ),
        ),
      );
    } else if (inProgress) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (list == null) {
      context.read<HomeModel>().loadBookingsList();
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (list.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: const Text('you_have_no_bookings').tr(),
        ),
      );
    }
    final hPadding = MediaQuery.of(context).size.width > 700
        ? MediaQuery.of(context).size.width * 0.1
        : 10.0;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      sliver: SliverMainAxisGroup(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'my_bookings',
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium?.fontSize,
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
                    onTap: () =>
                        context.go('/item/${list[index].contractAddress}'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inProgress = context.watch<HomeModel>().profileInProgress;
    final creds = Creds.credentials;
    final list = context.watch<HomeModel>().propertyList;
    if (creds == null && !inProgress) {
      return SliverFillRemaining(
        child: Center(
          child: ElevatedButton(
            child: const Text('login').tr(),
            onPressed: () async {
              final res = await showLoginDialog(context);
              if (context.mounted && res != null && Creds.setCredentials(res)) {
                await context.read<HomeModel>().loadPropertyList();
              }
            },
          ),
        ),
      );
    } else if (inProgress) {
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (list == null) {
      context.read<HomeModel>().loadBookingsList();
      return const SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (list.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: const Text('you_have_no_properties').tr(),
        ),
      );
    }
    final hPadding = MediaQuery.of(context).size.width > 700
        ? MediaQuery.of(context).size.width * 0.1
        : 10.0;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      sliver: SliverMainAxisGroup(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'my_properties',
                style: TextStyle(
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium?.fontSize,
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
                  return ItemView(
                    address: list[index].address,
                    onTap: () {
                      context.go('/bookings/${list[index].address}');
                    },
                    onEdit: () =>
                        context.go('/edit_item/${list[index].address}'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
