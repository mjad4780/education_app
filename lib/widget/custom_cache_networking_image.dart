import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Duration fadeInDuration;
  final bool useOldImageOnUrlChange;
  final BorderRadius? borderRadius;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.useOldImageOnUrlChange = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit,
          fadeInDuration: fadeInDuration,
          useOldImageOnUrlChange: useOldImageOnUrlChange,
          placeholder: (context, url) => placeholder ?? _buildPlaceholder(),
          errorWidget: (context, url, error) =>
              errorWidget ?? _buildErrorWidget(),
          memCacheWidth: width != null ? (width! * 3).toInt() : null,
          memCacheHeight: height != null ? (height! * 3).toInt() : null,
        ));
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[400]!),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Icon(
          Icons.broken_image,
          color: Colors.grey[400],
          size: 40,
        ),
      ),
    );
  }
}
