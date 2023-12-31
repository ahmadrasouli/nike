import 'package:flutter/material.dart';
import 'package:nike2/data/banner.dart';
import 'package:nike2/ui/widgets/image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class bannersSlider extends StatelessWidget {
  final PageController _controller = PageController();
  final List<BannerEntity> banners;
  bannersSlider({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        children: [
          PageView.builder(
              controller: _controller,
              itemCount: banners.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => _slide(banner: banners[index])),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: banners.length,
                axisDirection: Axis.horizontal,
                effect: WormEffect(
                    spacing: 4.0,
                    radius: 4.0,
                    dotWidth: 18.0,
                    dotHeight: 3.0,
                    paintStyle: PaintingStyle.fill,
                    dotColor: Colors.grey.shade400,
                    activeDotColor: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _slide extends StatelessWidget {
  final BannerEntity banner;
  const _slide({
    super.key,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: ImageLoadingService(
        borderRadius: BorderRadius.circular(30),
        imageUrl: banner.imageUrl,
      ),
    );
  }
}
