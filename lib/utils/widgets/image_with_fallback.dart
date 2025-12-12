import 'dart:math';

import 'package:flutter/material.dart';

class ImageWithFallback extends StatelessWidget {
  final String? assetPath;
  final String? networkUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Widget? placeholderChild;

  const ImageWithFallback.asset(
    this.assetPath, {
    super.key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
    this.placeholderChild,
  })  : networkUrl = null;

  const ImageWithFallback.network(
    this.networkUrl, {
    super.key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.borderRadius,
    this.placeholderChild,
  })  : assetPath = null;

  Color _randomLightColor() {
    final rnd = Random(assetPath?.hashCode ?? networkUrl?.hashCode ?? DateTime.now().millisecondsSinceEpoch);
    // generate pastel/light color using HSL
    final h = rnd.nextDouble() * 360;
    final s = 0.4 + rnd.nextDouble() * 0.3; // 0.4 - 0.7
    final l = 0.8; // light
    return HSLColor.fromAHSL(1.0, h, s, l).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final placeholder = placeholderChild ?? _DefaultPlaceholder(color: _randomLightColor());

    Widget child;
    if (assetPath != null) {
      child = Image.asset(
        assetPath!,
        fit: fit,
        width: width,
        height: height,
        errorBuilder: (context, error, stackTrace) => placeholder,
      );
    } else if (networkUrl != null) {
      child = Image.network(
        networkUrl!,
        fit: fit,
        width: width,
        height: height,
        loadingBuilder: (context, widget, progress) {
          if (progress == null) return widget;
          return Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                value: progress.expectedTotalBytes != null
                    ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => placeholder,
      );
    } else {
      child = placeholder;
    }

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: child);
    }
    return child;
  }
}

class _DefaultPlaceholder extends StatelessWidget {
  final Color color;
  const _DefaultPlaceholder({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: const Text(
        'No image',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
