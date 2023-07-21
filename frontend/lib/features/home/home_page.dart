import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/home/home.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('smart_booking').tr(),
            pinned: true,
          ),
          Builder(
            builder: (context) {
              final selectedPage = context.watch<HomeModel>().selectedPage;
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
      floatingActionButton: FloatingActionButton(
        tooltip: "Filter",
        onPressed: () {},
        child: const Icon(Icons.filter_list_alt),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          context.read<HomeModel>().selectedPage = index;
        },
        selectedIndex: context.watch<HomeModel>().selectedPage,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          NavigationDestination(
            icon: Icon(Icons.menu),
            label: "Bookings",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final list = context.read<HomeModel>();
    return SliverMainAxisGroup(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Text(
            'places_for_rent',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
            ),
          ).tr(),
        ),
        SliverList.list(
          children: <Widget>[
            // ...List.generate(, (index) => null),
          ],
        ),
      ],
    );
  }
}

class _BookingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Bookings"));
  }
}

class _ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }
}
