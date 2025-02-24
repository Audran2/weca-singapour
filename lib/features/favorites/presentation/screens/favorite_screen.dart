import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/dimensions.dart';
import '../../../../core/styles/shadows.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/favorite_product_model.dart';
import 'favorite_view_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = FavoriteViewModel(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double widgetWidth = constraints.maxWidth;
          final double widgetHeight = constraints.maxHeight;

          return Stack(
            children: [
              _buildHeader(widgetWidth, widgetHeight),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: widgetHeight * 0.16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _viewModel.isLoading,
                          builder: (context, isLoading, _) {
                            if (isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ValueListenableBuilder<
                                List<FavoriteProduct>>(
                              valueListenable: _viewModel.favoriteList,
                              builder: (context, product, _) {
                                if (!isLoading && product.isEmpty) {
                                  return Center(
                                    child: Text(
                                      "favorite.error.no_favorites".tr(),
                                    ),
                                  );
                                }

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ListView.separated(
                                    itemCount: product.length,
                                    itemBuilder: (context, index) {
                                      return _buildFavoriteCard(
                                          product, index, context);
                                    },
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 20),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Container _buildFavoriteCard(
      List<FavoriteProduct> product, int index, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding.extraLarge,
        vertical: AppDimensions.padding.extraLarge,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radius.extraLarge),
        boxShadow: [AppShadows.historyCardShadow],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radius.large),
            child: Image.network(
              product[index].image ?? "",
              width: AppDimensions.scannerDialog.buttonSize,
              height: AppDimensions.scannerDialog.buttonSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: AppDimensions.padding.xxLarge),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product[index].getBrand() ?? "",
                  style: AppTextStyles.bodyText2
                      .copyWith(color: AppColors.grey400),
                ),
                SizedBox(height: AppDimensions.margin.small),
                Text(
                  product[index].getName() ?? "",
                  style: AppTextStyles.subtitleText3,
                ),
              ],
            ),
          ),
          SizedBox(width: AppDimensions.padding.large),
          GestureDetector(
            onTap: () {
              context.push('/product', extra: product);
            },
            child: Container(
              width: AppDimensions.scannerDialog.buttonSize,
              height: AppDimensions.scannerDialog.buttonSize,
              decoration: BoxDecoration(
                color: ChartColors.primary500,
                borderRadius: BorderRadius.circular(AppDimensions.radius.large),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/arrow_next.svg',
                  width: AppTextSize.defaultIcon,
                  height: AppTextSize.defaultIcon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildHeader(double widgetWidth, double widgetHeight) {
    return Positioned(
      child: Container(
        width: widgetWidth,
        height: widgetHeight * 0.3,
        decoration: const BoxDecoration(
          color: ChartColors.primary500,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -40,
              right: -40,
              child: Transform.rotate(
                angle: -30 * 3.141592653589793 / 180,
                child: SvgPicture.asset(
                  'assets/icons/infos/Heart_01.svg',
                  width: 180,
                  height: 180,
                  colorFilter:
                      const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "favorite.title".tr(),
                      style: AppTextStyles.titleText1.copyWith(
                        color: AppColors.white,
                      ),
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
}
