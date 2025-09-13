import 'package:flutter/material.dart';

class ImageIconWidget extends StatelessWidget {
  final String path;
  final double width;
  const ImageIconWidget({super.key, required this.path, this.width = 110});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width / MediaQuery.of(context).devicePixelRatio,
        child: Image.asset(path));
  }
}

class ImageIconPath {
  static String get eyeOff => "assets/images/eye_off.png";
  static String get eyeOn => "assets/images/eye_on.png";
}
