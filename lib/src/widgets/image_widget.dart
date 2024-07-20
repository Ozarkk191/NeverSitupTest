import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const ImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.white,
          child: SizedBox(
            height: height,
            width: width,
          ),
        );
      },
    );
  }
}
