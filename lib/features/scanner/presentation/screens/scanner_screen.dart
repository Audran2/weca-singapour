import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';
import '../widgets/scanner_overlay_painter.dart';
import 'scanner_view_model.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final ScannerViewModel viewModel = ScannerViewModel();

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final widgetWidth = constraints.maxWidth;
          final widgetHeight = constraints.maxHeight;

          return Stack(
            children: [
              Positioned.fill(
                child: MobileScanner(
                  onDetect: viewModel.onBarcodeDetected,
                ),
              ),
              Positioned.fill(
                child: ValueListenableBuilder<List<Barcode>>(
                  valueListenable: viewModel.detectedBarcodes,
                  builder: (context, barcodes, _) {
                    return ValueListenableBuilder<Size>(
                      valueListenable: viewModel.cameraSize,
                      builder: (context, cameraSize, _) {
                        return CustomPaint(
                          painter: ScannerOverlayPainter(
                            barcodes: barcodes,
                            widgetSize: Size(widgetWidth, widgetHeight),
                            cameraSize: cameraSize,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  onPressed: () => context.pop(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Container(
                    padding: EdgeInsets.all(AppDimensions.padding.medium),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                      BorderRadius.circular(AppDimensions.radius.large),
                    ),
                    child: const Icon(
                      Icons.close,
                      size: AppTextSize.headlineSmall,
                      color: ChartColors.primary700,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: MediaQuery.of(context).size.width *
                    AppDimensions.topDialog.sidePaddingFactor,
                width: MediaQuery.of(context).size.width *
                    AppDimensions.topDialog.widthFactor,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding.xxxLarge,
                      vertical: AppDimensions.padding.extraLarge),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                    BorderRadius.circular(AppDimensions.radius.extraLarge),
                  ),
                  child: const Text(
                    'Please, scan your products',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
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
