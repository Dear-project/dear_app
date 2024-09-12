import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedCicleAvatar extends StatelessWidget {
  // Variables
  final String imageUrl;
  final double? radius;

  const CachedCicleAvatar(this.imageUrl, {Key? key, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      imageBuilder: (BuildContext c, ImageProvider p) {
        return CircleAvatar(
          radius: radius ?? 40,
          backgroundImage: p,
        );
      },
      placeholder: (context, url) =>
          CircleAvatar(radius: radius ?? 40, backgroundColor: Colors.white),
      errorWidget: (context, url, error) =>
      const Center(child: Icon(Icons.error, size: 50)),
    );
  }
}
