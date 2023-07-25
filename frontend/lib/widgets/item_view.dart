import 'package:flutter/material.dart';
import 'package:frontend/features/home/home.dart';
import 'package:provider/provider.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    required this.address,
    required this.onTap,
    this.onEdit,
  });

  final String address;
  final Function() onTap;
  final Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    final item = context.read<HomeModel>().getItem(address);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    item.images[0],
                    width: 300,
                    height: 200,
                    fit: BoxFit.fitHeight,
                    errorBuilder: (context, exception, stackTrace) {
                      return Image.asset(
                        'assets/images/placeholder-image.jpg',
                        width: 300,
                        height: 200,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${item.price} ETH',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 40),
                          if (onEdit != null)
                            IconButton(
                              onPressed: onEdit,
                              icon: const Icon(Icons.edit),
                            ),
                        ],
                      ),
                      Text(
                        item.location,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        item.description,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
