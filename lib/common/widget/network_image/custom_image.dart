import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:savemymind/common/app_assets.dart';
import 'package:savemymind/common/app_utils.dart';

class CustomImage extends StatefulWidget {
  final String imagePath;
  final XFile? storedImage;
  final double? width, height;
  const CustomImage({
    Key? key,
    required this.imagePath,
    this.storedImage,
    this.width,
    this.height,
  }) : super(key: key);
  @override
  _CustomImageState createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  Widget build(BuildContext context) {
    return AppUtils.isURL(widget.imagePath)
        ? CachedNetworkImage(
            imageUrl: widget.imagePath.trim(),
            errorWidget: (context, url, error) =>
                AppImage.asset(assetPath: AppAsset.icProfile),
            placeholder: (context, url) => const CircularProgressIndicator(),
            width: widget.width,
            height: widget.height,
            fit: BoxFit.fill,
          )
        : Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          );
  }
}
