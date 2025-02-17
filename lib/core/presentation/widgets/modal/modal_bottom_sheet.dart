import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

class ModalBottomSheet extends StatefulWidget {
  final Widget body;

  const ModalBottomSheet({super.key, required this.body});

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  double _heightFactor = 0.6;

  void _updateHeight(double delta) {
    final screenHeight = MediaQuery.of(context).size.height;
    setState(() {
      _heightFactor = (_heightFactor - delta / screenHeight).clamp(0.6, 0.95);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: const Duration(),
                height: MediaQuery.of(context).size.height * _heightFactor,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onVerticalDragUpdate: (details) {
                        _updateHeight(details.primaryDelta!);
                      },
                      child: buildTopBar(),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: widget.body,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopBar() {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Container(
          width: 60,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
