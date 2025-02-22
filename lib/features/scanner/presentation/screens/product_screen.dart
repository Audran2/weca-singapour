import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/modal/modal_bottom_sheet.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/product_model.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

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
                child: SvgPicture.asset(
                  'assets/icons/actions/Chevron_Left.svg',
                  height: AppTextSize.defaultIcon,
                  width: AppTextSize.defaultIcon,
                  colorFilter: const ColorFilter.mode(
                    ChartColors.primary700,
                    BlendMode.srcIn,
                  ),
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
          ModalBottomSheet(
            body: _modalBody(),
          ),
        ],
      ),
    );
  }

  Widget _modalBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: ChartColors.primary50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/infos/Leaf.svg',
                  width: AppTextSize.defaultIcon,
                  height: AppTextSize.defaultIcon,
                  colorFilter: const ColorFilter.mode(
                    ChartColors.secondary500,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "Vegetarian",
                  style: AppTextStyles.bodyText3.copyWith(
                    color: ChartColors.secondary500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            product.name,
            style: AppTextStyles.titleText1,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/infos/Star.svg',
                width: AppTextSize.defaultIcon,
                height: AppTextSize.defaultIcon,
                colorFilter: const ColorFilter.mode(
                  ChartColors.primary500,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                //TODO verify here
                product.score.toString(),
                style: AppTextStyles.bodyText3.copyWith(
                  color: ChartColors.primary300,
                ),
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                'assets/icons/infos/Health.svg',
                width: AppTextSize.defaultIcon,
                height: AppTextSize.defaultIcon,
                colorFilter: const ColorFilter.mode(
                  ChartColors.primary500,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                //TODO and here ?
                "Allergen free",
                style: AppTextStyles.bodyText3.copyWith(
                  color: ChartColors.primary300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: product.dangerousComponents.map((component) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _buildTag(component, 'assets/icons/infos/Triangle_Warning.svg'),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text(
            "Ingredients:",
            style: AppTextStyles.subtitleText3,
          ),
          const SizedBox(height: 4),
          Text(
            product.ingredients.map((ingredient) => "- $ingredient").join("\n"),
            style: AppTextStyles.bodyText2,
          ),
          const SizedBox(height: 20),
          const Text(
            "Description:",
            style: AppTextStyles.subtitleText3,
          ),
          const SizedBox(height: 4),
          Text(
            product.description,
            style: AppTextStyles.bodyText2,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/ads/${['ads_active_sg.png', 'ads_nature_glory.png'][Random().nextInt(2)]}',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, String icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: ChartColors.secondary50,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: AppTextSize.defaultIcon,
              height: AppTextSize.defaultIcon,
              colorFilter: const ColorFilter.mode(
                ChartColors.secondary500,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: AppTextStyles.subtitleText5.copyWith(
            color: ChartColors.secondary500,
          ),
        ),
      ],
    );
  }
}
