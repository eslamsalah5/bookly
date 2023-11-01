import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeaturedBook extends StatelessWidget {
  final String imageUrl;
  const FeaturedBook({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(8),
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
