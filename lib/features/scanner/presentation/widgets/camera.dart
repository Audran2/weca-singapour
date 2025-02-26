import 'dart:async';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';
import 'ask_to_add_default_dialog.dart';
import 'scanner_overlay_painter.dart';

class CameraWidget extends StatefulWidget {
  final void Function(String imagePath)? onPictureTaken;
  final Animation<Offset> offsetAnimation;
  final void Function() closeCamera;

  const CameraWidget({
    Key? key,
    this.onPictureTaken,
    required this.offsetAnimation,
    required this.closeCamera,
  }) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      // For each camera output the sensorOrientation and lensDirection.
      // This doesn't provide any useful descriptions to determine if its widelens.
      // After testing each index manually you will know which index is what exactly.
      for (var camera in cameras) {
        debugPrint('sensorOrientation: ${camera.sensorOrientation}');
        debugPrint('lensDirection: ${camera.lensDirection}');
        debugPrint('name: ${camera.name}');
      }

      _controller = CameraController(
        cameras.last,
        ResolutionPreset.ultraHigh,
      );
      _initializeControllerFuture = _controller.initialize();
      setState(() {});
    } else {
      print("Aucune caméra trouvée sur l'appareil.");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext globontext) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final isPortrait =
                MediaQuery.of(context).orientation == Orientation.portrait;
            final Size mediaSize = MediaQuery.of(context).size;

            return Stack(
              children: [
                /// 📷 **Affichage de la caméra avec le bon ratio d'aspect**
                SizedBox(
                  width: mediaSize.width,
                  height: mediaSize.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                        width: isPortrait
                            ? _controller.value.previewSize!.height
                            : _controller.value.previewSize!.width,
                        height: isPortrait
                            ? _controller.value.previewSize!.width
                            : _controller.value.previewSize!.height,
                        child: CameraPreview(_controller)),
                  ),
                ),

                /// 📷 **Affichage de la caméra avec le bon ratio d'aspect**
                SizedBox(
                  width: mediaSize.width,
                  height: mediaSize.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                        width: (isPortrait
                            ? _controller.value.previewSize!.height
                            : _controller.value.previewSize!.width) / 3,
                        height: (isPortrait
                            ? _controller.value.previewSize!.width
                            : _controller.value.previewSize!.height) / 2,
                        child: CustomPaint(
                          painter: ScannerOverlayPainter(
                            widgetSize: mediaSize,
                            cameraSize: mediaSize,
                          ),
                        )),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: IconButton(
                    onPressed: widget.closeCamera,
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

                /// 📍 **Bouton de capture**
                Positioned(
                  bottom: 150,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () async {
                          try {
                            await _initializeControllerFuture;
                            final image = await _controller.takePicture();
                            if (widget.onPictureTaken != null) {
                              widget.onPictureTaken!(image.path);
                            }
                          } catch (e) {
                            print("Erreur lors de la prise de photo : $e");
                          }
                        },
                        icon: const Icon(Icons.camera_alt,
                            color: Colors.white, size: 40),
                      ),
                    ),
                  ),
                ),
                AskToAddDefaultDialog(
                  offsetAnimation: widget.offsetAnimation,
                  label: "ask_to_add.dialog.info".tr(),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
