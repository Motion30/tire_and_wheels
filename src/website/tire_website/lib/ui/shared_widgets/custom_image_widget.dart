import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tire_website/utils/eums.dart';

class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    @required this.imageWidgetType,
    @required this.imageUrl,
    this.imageFile,
    this.boxFit = BoxFit.fill,
  });

  final ImageWidgetType imageWidgetType;
  final String imageUrl;
  final File imageFile;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    switch (imageWidgetType) {
      case ImageWidgetType.network:
        return Image.network(
          imageUrl,
          fit: BoxFit.fill,
          errorBuilder: (
            _,
            __,
            ___,
          ) {
            return const Placeholder();
          },
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent loadingProgress,
          ) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        );
        break;
      case ImageWidgetType.file:
        return Image.file(
          imageFile,
          fit: boxFit,
          errorBuilder: (
            _,
            __,
            ___,
          ) {
            return const Placeholder();
          },
        );
        break;
      case ImageWidgetType.asset:
        return Image.asset(
          imageUrl,
          fit: BoxFit.fill,
          errorBuilder: (
            _,
            __,
            ___,
          ) {
            return const Placeholder();
          },
        );
        break;
      case ImageWidgetType.none:
        return Center(child: Icon(Icons.person, color: Colors.grey[700]));
        break;
      default:
        return Center(child: Icon(Icons.person, color: Colors.grey[700]));
        break;
    }
  }
}
