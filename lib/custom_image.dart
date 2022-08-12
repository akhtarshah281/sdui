import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.imagePath,
    required this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius = BorderRadius.zero,

  }) : super(key: key);

  final String imagePath;
  final double height;
  final double? width;
  final BoxFit fit;
  final BorderRadius borderRadius;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: borderRadius,
      child: _widget(imagePath, size),
    );
  }

  Widget _widget(String path, Size size) {
    if (path.startsWith('http') ||
        path.startsWith('https') ||
        path.startsWith('www.')) {
      return CachedNetworkImage(
        width: width ?? size.width,
        height: height,
        fit: fit,
        imageUrl: path,
        errorWidget: (context, url, error) => Image.asset(
          'assets/images/dummy.png',
          width: width ?? size.width,
          height: height,
          fit: BoxFit.contain,
        ),
      );
    } else if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: width ?? size.width,
        fit: BoxFit.contain,
        color: Colors.cyan,
      );
    } else
      return Image.asset('assets/dummy.png');
  }
}
