import 'package:flutter/material.dart';
import 'package:funspler/general/constants/asset_constant.dart';

class ImageDisplayer extends StatelessWidget {
  final double width, height;
  final String path;
  final VoidCallback onTap;
  final int seed;
  const ImageDisplayer(
      {Key? key,
      required this.width,
      required this.height,
      required this.path,
      required this.onTap,
      required this.seed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: '$seed',
        child: FadeInImage.assetNetwork(
          placeholder: AssetConstant.shimmer,
          image: path,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
