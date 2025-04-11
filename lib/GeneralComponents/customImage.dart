import 'package:flutter/material.dart';
import '../GlobalVariables/colorGlobalVariables.dart';

class CustomImage extends StatelessWidget {
  final double? imageWidth;
  final double? imageHeight;
  final Color? imageBackgroundColor;
  final bool isAssetImage;
  final String imagePath;
  final double? imageBorderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomImage({
    this.imageWidth,
    this.imageHeight,
    this.imageBackgroundColor,
    required this.imagePath,
    required this.isAssetImage,
    this.imageBorderRadius,
    this.placeholder,
    this.errorWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _calculateBorderRadius(),
      child: Container(
        width: imageWidth ?? 45,
        height: imageHeight ?? 45,
        decoration: BoxDecoration(
          color: imageBackgroundColor ?? ColorGlobalVariables.greenColor.withOpacity(0.5),
          borderRadius: _calculateBorderRadius(),
        ),
        child: _buildImageContent(),
      ),
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
          fit: BoxFit.cover,
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
          fit: BoxFit.cover,
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
    return BorderRadius.circular(
      imageBorderRadius ?? (imageWidth ?? 45) * 0.5,
    );
  }
}