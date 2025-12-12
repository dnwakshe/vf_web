import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vf_app/utils/utils.dart';

class SvgWidgetCustom extends StatelessWidget {
  final String svgPath;
  final Color? color;
  final double? height;
  final double? width;

  const SvgWidgetCustom({super.key, required this.svgPath, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        height: height ?? Utils.screenHeight * 0.035,
        width: width,
        svgPath,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn): null,
    );
  }
}
