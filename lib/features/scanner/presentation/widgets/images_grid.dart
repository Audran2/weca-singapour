import 'dart:io';

import 'package:flutter/material.dart';

import 'picture_preview.dart';

class ImageGrid extends StatelessWidget {
  final List<File> images;
  final Function(File file) handleRemove;

  const ImageGrid({super.key, required this.images, required this.handleRemove});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return PicturePreview(image: images[index], handleRemove: handleRemove);
      },
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}
