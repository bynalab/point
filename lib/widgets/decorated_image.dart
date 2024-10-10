import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';

class DecoratedImageContainer extends StatelessWidget {
  final String imagePath;
  final String location;

  const DecoratedImageContainer({
    super.key,
    required this.imagePath,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(imagePath),
        ),
        const ImageOverlayDetails(
          location: 'Trefovela St., 43',
        ),
      ],
    );
  }
}

class ImageOverlayDetails extends StatelessWidget {
  final String location;
  final double? offset;

  const ImageOverlayDetails({super.key, required this.location, this.offset});

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      globalKey: GlobalKey(),
      repeat: true,
      duration: 1.seconds,
      offset: offset,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 5,
          left: 10,
          right: 10,
        ),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Text(location),
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
