import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final String icon;
  final double size;
  final Color? color;

  const AppIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      height: size,
      width: size,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
