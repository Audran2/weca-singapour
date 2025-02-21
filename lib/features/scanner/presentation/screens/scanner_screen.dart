import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/product_model.dart';
import '../widgets/scanner_default_dialog.dart';
import '../widgets/scanner_overlay_painter.dart';
import '../widgets/scanner_product_dialog.dart';
import 'scanner_view_model.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen>
    with TickerProviderStateMixin {
  late final ScannerViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ScannerViewModel(context: context);
    viewModel.initializeAnimation(this);
  }

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
                      size: AppTextSize.subtitle1,
                      color: ChartColors.primary700,
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder<Product?>(
                valueListenable: viewModel.product,
                builder: (context, product, _) {
                  return ScannerProductDialog(
                    offsetAnimation: viewModel.productDialogOffsetAnimation,
                    brand: "Tropicana",
                    label: "Orange juice",
                    imageUrl:
                    "https://i5.walmartimages.com/seo/Tropicana-Pure-Premium-Original-No-Pulp-100-Orange-Juice-46-Fl-Oz-Bottle_6f94bdc3-e12b-4366-bd7c-80001baee01a.b0e55c463b6fb53dd32c9b25df73cd04.jpeg",
                  );
                },
              ),
              ValueListenableBuilder<String>(
                valueListenable: viewModel.defaultDialogLabel,
                builder: (context, label, _) {
                  return ScannerDefaultDialog(
                    offsetAnimation: viewModel.defaultDialogOffsetAnimation,
                    label: label,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
