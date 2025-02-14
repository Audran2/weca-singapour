import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/styles/colors.dart';

class ScannerOverlayPainter extends CustomPainter {
  final List<Barcode> barcodes;
  final Size widgetSize;
  final Size cameraSize;

  ScannerOverlayPainter({
    required this.barcodes,
    required this.widgetSize,
    required this.cameraSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Important constants for scan ui
    const double cornerLength = 80;
    const double cornerRadius = 60;
    const double gap = 30;

    // Draw the rectangle
    final Rect rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height * 0.5),
      width: size.width * 0.8,
      height: size.height * 0.55,
    );

    final Paint cornerPaint = Paint()
      ..color = AppColors.black
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    _drawScannerRectangle(canvas, rect, gap, cornerLength, cornerPaint, cornerRadius);

    _drawBarCodePointer(canvas);
  }

  void _drawScannerRectangle(Canvas canvas, Rect rect, double gap, double cornerLength, Paint cornerPaint, double cornerRadius) {
    cornerPaint.strokeCap = StrokeCap.round;

    canvas
      // Top Left
      ..drawLine(Offset(rect.left + gap, rect.top), Offset(rect.left + cornerLength, rect.top), cornerPaint)
      ..drawArc(Rect.fromLTWH(rect.left, rect.top, cornerRadius, cornerRadius), pi, pi / 2, false, cornerPaint)
      ..drawLine(Offset(rect.left, rect.top + gap), Offset(rect.left, rect.top + cornerLength), cornerPaint)
      // Top Right
      ..drawLine(Offset(rect.right - cornerLength, rect.top), Offset(rect.right - gap, rect.top), cornerPaint)
      ..drawArc(Rect.fromLTWH(rect.right - cornerRadius, rect.top, cornerRadius, cornerRadius), 3 * pi / 2, pi / 2, false, cornerPaint)
      ..drawLine(Offset(rect.right, rect.top + gap), Offset(rect.right, rect.top + cornerLength), cornerPaint)
      // Bottom Left
      ..drawLine(Offset(rect.left + gap, rect.bottom), Offset(rect.left + cornerLength, rect.bottom), cornerPaint)
      ..drawArc(Rect.fromLTWH(rect.left, rect.bottom - cornerRadius, cornerRadius, cornerRadius), pi / 2, pi / 2, false, cornerPaint)
      ..drawLine(Offset(rect.left, rect.bottom - cornerLength), Offset(rect.left, rect.bottom - gap), cornerPaint)
      // Bottom Right
      ..drawLine(Offset(rect.right - cornerLength, rect.bottom), Offset(rect.right - gap, rect.bottom), cornerPaint)
      ..drawArc(Rect.fromLTWH(rect.right - cornerRadius, rect.bottom - cornerRadius, cornerRadius, cornerRadius), 0, pi / 2, false, cornerPaint)
    ..drawLine(Offset(rect.right, rect.bottom - cornerLength), Offset(rect.right, rect.bottom - gap), cornerPaint);
  }

  void _drawBarCodePointer(Canvas canvas) {
    if (cameraSize.width > 0 && cameraSize.height > 0) {
      final double scale = max(
        widgetSize.width / cameraSize.width,
        widgetSize.height / cameraSize.height,
      );
      final double fittedWidth = cameraSize.width * scale;
      final double fittedHeight = cameraSize.height * scale;
      final double dx = (widgetSize.width - fittedWidth) / 2;
      final double dy = (widgetSize.height - fittedHeight) / 2;

      final Paint pointPaint = Paint()
        ..color = Colors.green
        ..style = PaintingStyle.fill;

      for (final barcode in barcodes) {
        final corners = barcode.corners;
        if (corners.isNotEmpty) {
          double sumX = 0;
          double sumY = 0;
          for (final corner in corners) {
            final transformedX = corner.dx * scale + dx;
            final transformedY = corner.dy * scale + dy;
            sumX += transformedX;
            sumY += transformedY;
          }
          final center = Offset(sumX / corners.length, sumY / corners.length);

          canvas.drawCircle(center, 12, pointPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant ScannerOverlayPainter oldDelegate) {
    return oldDelegate.barcodes != barcodes ||
        oldDelegate.widgetSize != widgetSize ||
        oldDelegate.cameraSize != cameraSize;
  }
}
