import 'dart:io';
import 'package:dio/dio.dart';
import '../../domain/barcode_id.dart';

class AskToAddProductDTO {
  final BarcodeId barcode;
  final List<File> images;

  AskToAddProductDTO({required this.barcode, required this.images});

  Map<String, dynamic> toJson() {
    return {
      'barcode': barcode.value, // Assuming toString() returns a valid barcode
      'images[]': images.map((file) {
        return MultipartFile.fromFileSync(file.path,
            filename: file.uri.pathSegments.last);
      }).toList(), // Ensure that this is a list of MultipartFile objects
    };
  }
}
