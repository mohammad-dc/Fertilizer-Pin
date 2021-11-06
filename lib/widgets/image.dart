import 'package:flutter/material.dart';

class FertilizerImage extends StatelessWidget {
  final double width, height;
  final String networkImage, assetsImage;
  final bool image;

  const FertilizerImage(
      {Key? key,
      this.width = 100,
      this.height = 100,
      required this.networkImage,
      this.assetsImage = '/assets/images/user.png',
      this.image = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: image
                  ? NetworkImage(networkImage)
                  : AssetImage(assetsImage) as ImageProvider,
              fit: BoxFit.cover)),
    );
  }
}
