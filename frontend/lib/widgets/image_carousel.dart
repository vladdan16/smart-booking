import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    super.key,
    required this.imgList,
    this.imageHeight = 400,
  });

  final List<String> imgList;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return Stack(
      children: [
        SizedBox(
          height: imageHeight,
          child: PageView.builder(
            controller: pageController,
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return Image.network(
                imgList[index],
                fit: BoxFit.fitHeight,
              );
            },
          ),
        ),
        Positioned(
          left: 10,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
        Positioned(
          right: 10,
          top: 0,
          bottom: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ],
    );
  }
}
