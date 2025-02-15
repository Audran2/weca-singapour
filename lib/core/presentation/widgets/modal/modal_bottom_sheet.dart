import 'package:flutter/material.dart';

import '../../../styles/dimensions.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              buildTopBar(),
              SizedBox(height: AppDimensions.margin.extraLarge),
              _buildBody(scrollController, context),
            ],
          ),
        );
      },
    );
  }

  Widget buildTopBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        width: 80,
        height: 6,
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildBody(ScrollController scrollController, BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: const Column(),
        ),
      ),
    );
  }
}
