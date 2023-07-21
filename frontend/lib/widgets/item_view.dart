import 'package:flutter/material.dart';
import 'package:frontend/features/home/home.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    required this.address,
  });

  final String address;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<HomeModel>().getItemData(address),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final (bytes, price, description) = snapshot.data!;
          return ListTile(
            leading: Image.memory(bytes),
            title: Text(price),
            subtitle: Text(description),
            onTap: () {
              context.go('/item/$address');
            },
          );
        } else {
          return const ListTile(
            title: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
