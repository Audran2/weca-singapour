import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  List<Barcode> detectedBarcodes = [];
  Size cameraSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              MobileScanner(
                onDetect: (BarcodeCapture capture) {
                  setState(() {
                    detectedBarcodes = capture.barcodes;
                    if (capture.size != Size.zero) {
                      cameraSize = capture.size;
                    } else if (capture.barcodes.isNotEmpty) {
                      cameraSize = capture.barcodes.first.size;
                    }
                  });

                  for (var barcode in capture.barcodes) {
                    print("QR Code trouvé : ${barcode.rawValue}");
                    print("Coins détectés : ${barcode.corners}");
                  }
                },
              ),
              CustomPaint(
                painter: BarcodeOverlayPainter(
                  barcodes: detectedBarcodes,
                  widgetSize: Size(constraints.maxWidth, constraints.maxHeight),
                  cameraSize: cameraSize,
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Text(
                    '${detectedBarcodes.length} codes barres',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BarcodeOverlayPainter extends CustomPainter {
  final List<Barcode> barcodes;
  final Size widgetSize;
  final Size cameraSize;

  BarcodeOverlayPainter({
    required this.barcodes,
    required this.widgetSize,
    required this.cameraSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    print("Taille écran: $widgetSize");
    print("Taille de la camera: $cameraSize");

    final pointPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    if (cameraSize.width == 0 || cameraSize.height == 0) {
      return;
    }

    // Mise à l'échelle entre taille widget et caméra
    final scale = max(widgetSize.width / cameraSize.width, widgetSize.height / cameraSize.height);
    final fittedWidth = cameraSize.width * scale;
    final fittedHeight = cameraSize.height * scale;
    final dx = (widgetSize.width - fittedWidth) / 2;
    final dy = (widgetSize.height - fittedHeight) / 2;

    for (final barcode in barcodes) {
      final corners = barcode.corners;

      if (corners.isNotEmpty) {
        final List<Offset> transformedCorners = corners.map((corner) {
          // Calcul des coordonnées sur la mise à l'échelle
          final transformedX = corner.dx * scale + dx;
          final transformedY = corner.dy * scale + dy;
          // Correction des coordonnées dû au décalage de l'objectif -> à voir résultat sur IOS
          const correctionX = 175.0;
          const correctionY = -150.0;
          final adjustedX = transformedX + correctionX;
          final adjustedY = transformedY + correctionY;
          print("default corner: $dx, $dy -> Transformed corner: $adjustedX, $adjustedY");
          return Offset(adjustedX, adjustedY);
        }).toList();

        final center = transformedCorners.reduce((a, b) => Offset(a.dx + b.dx, a.dy + b.dy)) /
            transformedCorners.length.toDouble();

        canvas.drawCircle(center, 12, pointPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant BarcodeOverlayPainter oldDelegate) {
    return oldDelegate.barcodes != barcodes || oldDelegate.widgetSize != widgetSize;
  }
}