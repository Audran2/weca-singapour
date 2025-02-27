import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/modal/modal_bottom_sheet.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/item_model.dart';
import '../../domain/product_model.dart';
import '../widgets/allergy_card.dart';
import '../widgets/allergy_tag.dart';
import 'product_view_model.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ProductViewModel(context: context, isFavorite: widget.product.isFavorite);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

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
              widget.product.imageUrl,
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
          Row(
            children: [
              if (widget.product.hasProblems()) ...[
                AllergyCard(
                  label: "product.alert".tr(),
                  icon: 'assets/icons/infos/Triangle_Warning.svg',
                  backgroundColor: ChartColors.secondary900,
                  fontColor: AppColors.white,
                ),
                const SizedBox(width: 8),
              ],
              for (Item preference in widget.product.preferences)
                AllergyCard(
                  label: preference.name,
                  icon: 'assets/icons/infos/Leaf.svg',
                  backgroundColor: ChartColors.primary50,
                  fontColor: ChartColors.secondary500,
                ),
              if (widget.product.allergies.isEmpty) ...[
                _buildFavoriteIcon(),
              ],
            ],
          ),
          const SizedBox(height: 20),
          Text(
            widget.product.name,
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
                widget.product.getScore(),
                style: AppTextStyles.bodyText3.copyWith(
                  color: ChartColors.primary300,
                ),
              ),
              const SizedBox(width: 16),
              if (widget.product.allergies.isEmpty) ...[
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
                  "Allergen free",
                  style: AppTextStyles.bodyText3.copyWith(
                    color: ChartColors.primary300,
                  ),
                ),
              ],
            ],
          ),
          if (widget.product.dangerousComponents.isNotEmpty ||
              widget.product.intolerances.isNotEmpty) ...[
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...widget.product.intolerances.map((intolerance) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: AllergyTag(
                        item: intolerance,
                        icon: 'assets/icons/infos/Octagon_Warning.svg',
                        backgroundColor: ChartColors.secondary900,
                        iconColor: AppColors.white,
                        fontColor: ChartColors.secondary900,
                      ),
                    );
                  }).toList(),
                  ...widget.product.dangerousComponents.map((component) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: AllergyTag(
                        item: component,
                        icon: 'assets/icons/infos/Triangle_Warning.svg',
                        backgroundColor: ChartColors.secondary50,
                        iconColor: ChartColors.secondary500,
                        fontColor: ChartColors.secondary500,
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
          if (widget.product.ingredients.isNotEmpty) ...[
            const SizedBox(height: 20),
            const Text(
              "Ingredients:",
              style: AppTextStyles.subtitleText3,
            ),
            const SizedBox(height: 4),
            Text(
              widget.product.ingredients
                  .map((ingredient) => "- $ingredient")
                  .join("\n"),
              style: AppTextStyles.bodyText2,
            ),
          ],
          const SizedBox(height: 20),
          const Text(
            "Description:",
            style: AppTextStyles.subtitleText3,
          ),
          const SizedBox(height: 4),
          MarkdownBody(
            data: widget.product.description,
            styleSheet: MarkdownStyleSheet(
              p: AppTextStyles.bodyText2,
              strong:
                  AppTextStyles.bodyText2.copyWith(fontWeight: FontWeight.bold),
              em: AppTextStyles.bodyText2.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/ads/${[
              'ads_active_sg.png',
              'ads_nature_glory.png'
            ][Random().nextInt(2)]}',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Expanded _buildFavoriteIcon() {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () => viewModel.toggleLike(context, widget.product.id),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ChartColors.primary50,
              borderRadius: BorderRadius.circular(24),
            ),
            child: SvgPicture.asset(
              'assets/icons/infos/Heart_01.svg',
              width: AppTextSize.defaultIcon,
              height: AppTextSize.defaultIcon,
              colorFilter: const ColorFilter.mode(
                ChartColors.primary600,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
