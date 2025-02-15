import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/modal/modal_bottom_sheet.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () => context.pop(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  size: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.42,
            child: Image.network(
              'https://images-platform.99static.com/lnz3Ev1acDg9WGpjnv2-CQGK52g=/0x0:2000x2000/500x500/top/smart/99designs-contests-attachments/127/127533/attachment_127533869',
              fit: BoxFit.cover,
            ),
          ),
          const ModalBottomSheet(),
        ],
      ),
    );
  }
}
