import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppNetworkImageWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final bool? hasCircularBorder;
  final String? imgUrl;
  const AppNetworkImageWidget(
      {super.key,
      this.width = 100,
      this.height = 100,
      this.hasCircularBorder = false,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(hasCircularBorder! ? 10 : 0),
        child: CachedNetworkImage(
          key: UniqueKey(),
          imageUrl: imgUrl ??
              'https://content.asos-media.com/-/media/hubs/about-us/about-asos/feb-update/about-asos-1-new-size-asos_brands.jpg',
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) =>
              Icon(Icons.error, color: Colors.red, size: width! * 0.8),
          height: height!,
          width: width!,
        ),
      ),
    );
  }
}
