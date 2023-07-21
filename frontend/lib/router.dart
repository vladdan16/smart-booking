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
          return ChangeNotifierProvider(
            create: (context) => HomeModel(),
            child: const HomePage(),
          );
        },
      ),
      GoRoute(
          path: '/item/:address',
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (context) => ItemModel(state.pathParameters['address']!),
              child: const ItemPage(),
            );
          }),
    ],
  );
}
