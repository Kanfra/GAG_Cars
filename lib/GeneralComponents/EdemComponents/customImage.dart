import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;
  final Color? imageBackgroundColor;
  final bool isAssetImage;
  final String imagePath;
  final double? imageBorderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final bool isImageBorderRadiusRequired;
  final BoxFit? fit;

  const CustomImage({
    this.imageWidth,
    this.imageHeight,
    this.imageBackgroundColor,
    required this.imagePath,
    required this.isAssetImage,
    required this.isImageBorderRadiusRequired,
    this.imageBorderRadius,
    this.placeholder,
    this.errorWidget,
    this.fit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth ?? 45,
      height: imageHeight ?? 45,
      decoration: BoxDecoration(
        color: imageBackgroundColor ?? Colors.transparent,
        borderRadius: _calculateBorderRadius(),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageBorderRadius ?? 0),
        child: _buildImageContent()),
    );
  }

  Widget _buildImageContent() {
    if (imagePath.isEmpty) {
      return errorWidget ?? _defaultErrorWidget();
    }

    try {
      if (isAssetImage) {
        return Image.asset(
          imagePath,
          fit: fit ?? BoxFit.contain,
          width: imageWidth ?? 45,
          height: imageHeight ?? 45,
          errorBuilder: (_, __, ___) {
            debugPrint('Failed to load asset image: $imagePath');
            return errorWidget ?? _defaultErrorWidget();
          },
        );
      } else {
        return Image.network(
          imagePath,
          fit: fit ?? BoxFit.cover,
          width: imageWidth ?? 45,
          height: imageHeight ?? 45,
          loadingBuilder: (_, child, progress) {
            if (progress == null) return child;
            return placeholder ?? _defaultPlaceholder();
          },
          errorBuilder: (_, __, ___) {
            debugPrint('Failed to load network image: $imagePath');
            return errorWidget ?? _defaultErrorWidget();
          },
        );
      }
    } catch (e) {
      debugPrint('Image loading error: $e');
      return errorWidget ?? _defaultErrorWidget();
    }
  }

  Widget _defaultErrorWidget() {
    return Center(
      child: Icon(
        Icons.broken_image,
        size: (imageWidth ?? 45) * 0.4,
        color: Colors.grey[400],
      ),
    );
  }

  Widget _defaultPlaceholder() {
    return Center(
      child: SizedBox(
        width: (imageWidth ?? 45) * 0.3,
        height: (imageWidth ?? 45) * 0.3,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.grey[300],
        ),
      ),
    );
  }

  BorderRadius _calculateBorderRadius() {
    if (!isImageBorderRadiusRequired) {
      return BorderRadius.circular(0);
    }
    return BorderRadius.circular(
      imageBorderRadius ?? (imageWidth ?? 45) * 0.5,
    );
  }
}