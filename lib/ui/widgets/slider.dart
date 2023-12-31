import 'package:flutter/material.dart';
import 'package:nike2/data/banner.dart';
import 'package:nike2/ui/widgets/image.dart';

class bannersSlider extends StatelessWidget {
  final List<BannerEntity> banners;
  const bannersSlider({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
          itemCount: banners.length,
          itemBuilder: (context, index) => ImageLoadingService(
                borderRadius: BorderRadius.circular(30),
                imageUrl: banners[index].imageUrl,
              )),
    );
  }
}
