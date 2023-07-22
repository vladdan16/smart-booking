import 'package:flutter/material.dart';
import 'package:frontend/widgets/widgets.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: ImageCarousel(
              imgList: [],
            ),
          ),
        ],
      ),
    );
  }
}