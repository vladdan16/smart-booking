import 'package:frontend/features/home/home.dart';
import 'package:frontend/features/item/item.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    ],
  );
}
