import 'package:frontend/features/edit_item/edit_item.dart';
import 'package:frontend/features/home/home.dart';
import 'package:frontend/features/item/item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'features/bookings/bookings.dart';

class AppRouter {
  static final router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/item/:address',
        builder: (context, state) {
          final address = state.pathParameters['address']!;
          final item = context.read<HomeModel>().getItem(address);
          return ChangeNotifierProvider(
            create: (context) => ItemModel(item),
            child: const ItemPage(),
          );
        },
      ),
      GoRoute(
        path: '/edit_item/:address',
        builder: (context, state) {
          final address = state.pathParameters['address']!;
          final item = address != 'new'
              ? context.read<HomeModel>().getItem(address)
              : null;
          return ChangeNotifierProvider(
            create: (context) => EditItemModel(item),
            child: const EditItemPage(),
          );
        },
      ),
      GoRoute(
        path: '/bookings/:address',
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (context) => BookingsModel(state.pathParameters['address']!),
            child: const BookingsPage(),
          );
        },
      ),
    ],
  );
}
