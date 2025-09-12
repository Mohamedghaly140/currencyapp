import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCachedImage extends StatelessWidget {
  final String mediaUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final BoxShape shape;

  const CustomCachedImage({
    super.key,
    required this.mediaUrl,
    this.width = 70.0,
    this.height = 70.0,
    this.fit = BoxFit.cover,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    // Validate URL before processing
    if (mediaUrl.isEmpty || mediaUrl.trim().isEmpty) {
      return _buildPlaceholder();
    }

    // Try to parse the URI to ensure it's valid
    final uri = Uri.tryParse(mediaUrl);
    if (uri == null || !uri.hasAbsolutePath) {
      return _buildPlaceholder();
    }

    // Additional validation for SVG URLs
    if (mediaUrl.trim().toLowerCase().endsWith('.svg')) {
      // For SVG files, we need to be extra careful as they can cause parsing errors
      return SvgPicture.network(
        mediaUrl,
        width: width,
        height: height,
        fit: fit,
        allowDrawingOutsideViewBox: true,
        placeholderBuilder: (BuildContext context) => _buildPlaceholder(),
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
              // If SVG parsing fails, show placeholder
              return _buildPlaceholder();
            },
      );
    } else {
      return CachedNetworkImage(
        fit: fit,
        imageUrl: mediaUrl,
        width: width,
        height: height,
        imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: shape,
            image: DecorationImage(image: imageProvider, fit: fit),
          ),
        ),
        placeholder: (context, url) => _buildPlaceholder(),
        errorWidget: (context, url, error) => _buildPlaceholder(),
      );
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: shape,
        color: const Color(0xFFF2F4F7), // Light gray background
      ),
      child: const Center(
        child: Icon(Icons.image_not_supported, color: Color(0xFF808080)),
      ),
    );
  }
}
