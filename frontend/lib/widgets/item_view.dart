import 'package:flutter/material.dart';
import 'package:frontend/features/home/home.dart';
import 'package:provider/provider.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    required this.address,
    required this.onTap,
  });

  final String address;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final item = context.read<HomeModel>().getItem(address);
    return ListTile(
      leading: item.images.isNotEmpty
          ? Image.network(item.images[0])
          : const SizedBox(
              width: 100,
              height: 100,
            ),
      title: Text('${item.price} ETH'),
      subtitle: Text(
        '${item.location}\n${item.description}',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
