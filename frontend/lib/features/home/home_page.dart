import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/home/home.dart';
import 'package:frontend/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedPage = context.watch<HomeModel>().selectedPage;
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
      floatingActionButton: FloatingActionButton(
        tooltip: "Filter",
        onPressed: () {},
        child: const Icon(Icons.filter_list_alt),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          context.read<HomeModel>().selectedPage = index;
        },
        selectedIndex: selectedPage,
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
    final hPadding = MediaQuery.of(context).size.width > 700
        ? MediaQuery.of(context).size.width * 0.1
        : 10.0;
    final list = context.read<HomeModel>();
    return FutureBuilder(
      future: context.read<HomeModel>().loadItemList(),
      builder: (context, state) {
        if (state.connectionState != ConnectionState.done) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          final list = context.read<HomeModel>().itemList;
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverMainAxisGroup(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      'places_for_rent',
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
      },
    );
  }
}

class _BookingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text('Bookings'),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }
}
