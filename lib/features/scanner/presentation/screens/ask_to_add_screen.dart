import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/button/primary_button.dart';
import '../../../../core/presentation/widgets/button/secondary_button.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/barcode_id.dart';
import '../widgets/ask_to_add_default_dialog.dart';
import '../widgets/camera.dart';
import '../widgets/images_grid.dart';
import 'ask_to_add_view_model.dart';

class AskToAddScreen extends StatefulWidget {
  final BarcodeId barcode;

  const AskToAddScreen({super.key, required this.barcode});

  @override
  _AskToAddScreenState createState() => _AskToAddScreenState();
}

class _AskToAddScreenState extends State<AskToAddScreen>
    with TickerProviderStateMixin {
  late AskToAddViewModel viewModel;
  bool _isCameraOpen = false;

  @override
  void initState() {
    super.initState();
    viewModel = AskToAddViewModel(context: context, barcode: widget.barcode);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void _handlePictureTaken(String imagePath) {
    viewModel.addImage(imagePath);

    _closeCamera();
  }

  void _openCamera() {
    setState(() {
      _isCameraOpen = true;
      viewModel.initializeAnimation(this);
    });
  }

  void _closeCamera() {
    setState(() {
      _isCameraOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_isCameraOpen)
            Expanded(
              child: CameraWidget(
                onPictureTaken: _handlePictureTaken,
                offsetAnimation: viewModel.defaultDialogOffsetAnimation,
                closeCamera: _closeCamera,
              ),
            )
          else
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  top: AppDimensions.padding.xxxLarge,
                  left: AppDimensions.padding.xxxLarge,
                  right: AppDimensions.padding.xxxLarge,
                  bottom: AppDimensions.padding.xxxLarge,
                ),
                child: Column(
                  children: [
                    Text(
                      "ask_to_add.title".tr(),
                      style: AppTextStyles.titleText1,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "ask_to_add.indication".tr(),
                      style: AppTextStyles.bodyText1,
                    ),
                    SizedBox(
                      height: AppDimensions.padding.xxxLarge,
                    ),
                    SecondaryButton(
                        label: "ask_to_add.take_picture".tr(),
                        onPressed: _openCamera),
                    SizedBox(
                      height: AppDimensions.padding.medium,
                    ),
                    if (viewModel.images.value.isEmpty)
                      Text('ask_to_add.empty_grid'.tr())
                    else
                      ValueListenableBuilder(
                          valueListenable: viewModel.images,
                          builder: (context, images, child) {
                            return Container(
                                height:
                                    (viewModel.images.value.length / 3).ceil() *
                                        150,
                                child: ImageGrid(
                                  images: images,
                                  handleRemove: viewModel.removeImage,
                                ));
                          }),
                    Container(
                      height: 20,
                    ),
                    Text(
                      "ask_to_add.advice".tr(),
                      style: AppTextStyles.bodyText3,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: viewModel.isLoading,
                            builder: (context, isLoading, child) {
                              return PrimaryButton(
                                label: "ask_to_add.submit".tr(),
                                onPressed: () {
                                  print("Pressed");
                                  viewModel.sendDemand(context);
                                },
                                isLoading: isLoading,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
