import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

class ScannerOverlayPainter extends CustomPainter {
  final Size widgetSize;
  final Size cameraSize;

  ScannerOverlayPainter({
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

    _drawScannerRectangle(
        canvas, rect, gap, cornerLength, cornerPaint, cornerRadius);
  }

  void _drawScannerRectangle(Canvas canvas, Rect rect, double gap,
      double cornerLength, Paint cornerPaint, double cornerRadius) {
    cornerPaint.strokeCap = StrokeCap.round;

    canvas
      // Top Left
      ..drawLine(Offset(rect.left + gap, rect.top),
          Offset(rect.left + cornerLength, rect.top), cornerPaint)
      ..drawArc(Rect.fromLTWH(rect.left, rect.top, cornerRadius, cornerRadius),
          pi, pi / 2, false, cornerPaint)
      ..drawLine(Offset(rect.left, rect.top + gap),
          Offset(rect.left, rect.top + cornerLength), cornerPaint)
      // Top Right
      ..drawLine(Offset(rect.right - cornerLength, rect.top),
          Offset(rect.right - gap, rect.top), cornerPaint)
      ..drawArc(
          Rect.fromLTWH(
              rect.right - cornerRadius, rect.top, cornerRadius, cornerRadius),
          3 * pi / 2,
          pi / 2,
          false,
          cornerPaint)
      ..drawLine(Offset(rect.right, rect.top + gap),
          Offset(rect.right, rect.top + cornerLength), cornerPaint)
      // Bottom Left
      ..drawLine(Offset(rect.left + gap, rect.bottom),
          Offset(rect.left + cornerLength, rect.bottom), cornerPaint)
      ..drawArc(
          Rect.fromLTWH(rect.left, rect.bottom - cornerRadius, cornerRadius,
              cornerRadius),
          pi / 2,
          pi / 2,
          false,
          cornerPaint)
      ..drawLine(Offset(rect.left, rect.bottom - cornerLength),
          Offset(rect.left, rect.bottom - gap), cornerPaint)
      // Bottom Right
      ..drawLine(Offset(rect.right - cornerLength, rect.bottom),
          Offset(rect.right - gap, rect.bottom), cornerPaint)
      ..drawArc(
          Rect.fromLTWH(rect.right - cornerRadius, rect.bottom - cornerRadius,
              cornerRadius, cornerRadius),
          0,
          pi / 2,
          false,
          cornerPaint)
      ..drawLine(Offset(rect.right, rect.bottom - cornerLength),
          Offset(rect.right, rect.bottom - gap), cornerPaint);
  }

  @override
  bool shouldRepaint(covariant ScannerOverlayPainter oldDelegate) {
    return oldDelegate.widgetSize != widgetSize ||
        oldDelegate.cameraSize != cameraSize;
  }
}
