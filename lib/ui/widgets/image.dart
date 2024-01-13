import 'package:flutter/material.dart';

class ImageLoadingService extends StatelessWidget {
  final String imageUrl;
  final BorderRadius? borderRadius;
  const ImageLoadingService({
    super.key,
    required this.imageUrl,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius!,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ));
  }
}
