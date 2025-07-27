import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
  final bool useCache;
  final bool useShimmerEffect;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;

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
    this.useCache = true,
    this.useShimmerEffect = true,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
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
          fit: fit ?? BoxFit.contain,
          width: imageWidth,
          height: imageHeight,
          errorBuilder: (_, __, ___) {
            debugPrint('Failed to load asset image: $imagePath');
            return errorWidget ?? _defaultErrorWidget();
          },
        );
      } else {
        if (useCache) {
          return CachedNetworkImage(
            imageUrl: imagePath,
            width: imageWidth,
            height: imageHeight,
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => 
                placeholder ?? _defaultPlaceholder(),
            errorWidget: (context, url, error) {
              debugPrint('Failed to load network image: $url, $error');
              return errorWidget ?? _defaultErrorWidget();
            },
            memCacheWidth: imageWidth?.toInt(),
            memCacheHeight: imageHeight?.toInt(),
            fadeInDuration: const Duration(milliseconds: 300),
          );
        } else {
          return Image.network(
            imagePath,
            fit: fit ?? BoxFit.cover,
            width: imageWidth,
            height: imageHeight,
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
    if (useShimmerEffect) {
      return Shimmer.fromColors(
        baseColor: shimmerBaseColor ?? Colors.grey[300]!,
        highlightColor: shimmerHighlightColor ?? Colors.grey[100]!,
        child: Container(
          color: Colors.white,
          width: imageWidth ?? 45,
          height: imageHeight ?? 45,
        ),
      );
    } else {
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