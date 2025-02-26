import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../scanner/domain/barcode_id.dart';
import '../../domain/user_data_domain.dart';
import '../widgets/home_card_navigation.dart';
import '../widgets/home_explore_card.dart';
import '../widgets/home_explore_half_card.dart';
import '../widgets/shimmer_loading.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = HomeViewModel(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 24, right: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                Text(
                  "home.grid_stats.label".tr(),
                  style: AppTextStyles.bodyText1,
                ),
                const SizedBox(height: 42),
                _buildHomeGrid(context),
                const SizedBox(height: 40),
                HomeExploreCard(
                  title: "home.shop_card.brand_center.title".tr(),
                  description: "home.shop_card.brand_center.description".tr(),
                  imageUrl: 'assets/images/card_lifestyle/brand_center.png',
                  color: ChartColors.primary500,
                  onTap: () => context.pushNamed('brandCenter'),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeExploreHalfCard(
                      title: "home.shop_card.quality_supplements.title".tr(),
                      imageUrl:
                          'assets/images/card_lifestyle/shop_quality_supplements_now.webp',
                      primaryColor: ChartColors.primary200,
                      secondaryColor:
                          ChartColors.primary50.withValues(alpha: 0.5),
                    ),
                    const SizedBox(width: 24),
                    HomeExploreHalfCard(
                      title: "home.shop_card.quality_gym.title".tr(),
                      imageUrl:
                          'assets/images/card_lifestyle/shop_quality_gym_apparels_now.webp',
                      primaryColor: ChartColors.secondary200,
                      secondaryColor:
                          ChartColors.secondary50.withValues(alpha: 0.5),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "default.action.explore".tr(),
                      style: AppTextStyles.bodyText1,
                    ),
                    SvgPicture.asset(
                      'assets/icons/actions/Arrow_Right_MD.svg',
                      height: AppTextSize.defaultIcon,
                      width: AppTextSize.defaultIcon,
                    )
                  ],
                ),
                const SizedBox(height: 40),
                HomeExploreCard(
                  title: "home.dietitians.title".tr(),
                  description: "home.dietitians.description".tr(),
                  imageUrl:
                      'assets/images/card_lifestyle/consult_dietitians.png',
                  color: ChartColors.primary500,
                ),
                const SizedBox(height: 40),
                HomeExploreCard(
                  title: "home.faq.title".tr(),
                  description: "home.faq.description".tr(),
                  imageUrl: 'assets/images/card_lifestyle/faq_on_allergies.png',
                  color: ChartColors.secondary500,
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () => context.pushNamed('articles'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "home.articles.action_button.all".tr(),
                        style: AppTextStyles.bodyText1,
                      ),
                      SvgPicture.asset(
                        'assets/icons/actions/Arrow_Right_MD.svg',
                        height: AppTextSize.defaultIcon,
                        width: AppTextSize.defaultIcon,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeExploreHalfCard(
                      title: "home.articles.macronutriments.title".tr(),
                      imageUrl:
                          'assets/images/card_lifestyle/macronutriments.png',
                      primaryColor: ChartColors.primary200,
                      secondaryColor:
                          ChartColors.primary50.withValues(alpha: 0.5),
                    ),
                    const SizedBox(width: 24),
                    HomeExploreHalfCard(
                      title: "home.articles.muscle_growth.title".tr(),
                      imageUrl:
                          'assets/images/card_lifestyle/muscle_growth.png',
                      primaryColor: ChartColors.secondary200,
                      secondaryColor:
                          ChartColors.secondary50.withValues(alpha: 0.5),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "home.welcome".tr(),
              style: AppTextStyles.titleText3,
            ),
            ValueListenableBuilder<UserData?>(
              valueListenable: _viewModel.userData,
              builder: (context, userData, child) {
                final String name = userData?.name ?? '';
                if (name.isEmpty) {
                  return FutureBuilder(
                    future: Future.delayed(Duration.zero),
                    builder: (context, snapshot) {
                      return const ShimmerLoading(
                        width: 80.0,
                        height: 20.0,
                      );
                    },
                  );
                }
                return Text(
                  name,
                  style: AppTextStyles.bodyText1,
                );
              },
            )
          ],
        ),
        Image.asset(
          'assets/images/card_lifestyle/hello_boy.png',
          height: 74,
          width: 74,
        ),
      ],
    );
  }

  Widget _buildHomeGrid(BuildContext context) {
    return ValueListenableBuilder<UserData?>(
      valueListenable: _viewModel.userData,
      builder: (context, userData, child) {
        final bool isData = userData != null;

        return GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 200,
          ),
          children: [
            HomeCardNavigation(
              icon: "assets/icons/infos/scanner.svg",
              title: "home.grid_stats.scan.label".tr(),
              subtitle: userData?.getProductScanned() ?? "",
              onTap: () => context.push('/scan'),
              isData: isData,
            ),
            HomeCardNavigation(
              icon: "assets/icons/infos/not_found.svg",
              title: "home.grid_stats.not_found.label".tr(),
              subtitle: userData?.getProductScannedFailed() ?? "",
              onTap: () {
                context.push("/ask-to-add", extra: BarcodeId("0123456789101"));
                /*Fluttertoast.showToast(
                  msg: "Feature not available yet",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: AppColors.black,
                  textColor: AppColors.white,
                  fontSize: 16.0,
                );*/
              },
              isData: isData,
            ),
            HomeCardNavigation(
              icon: "assets/icons/infos/success.svg",
              title: "home.grid_stats.success.label".tr(),
              subtitle: userData?.getProductScannedSuccess() ?? "",
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Feature not available yet",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: AppColors.black,
                  textColor: AppColors.white,
                  fontSize: 16.0,
                );
              },
              isData: isData,
            ),
            HomeCardNavigation(
              icon: "assets/icons/infos/favorite.svg",
              title: "home.grid_stats.favorite.label".tr(),
              subtitle: userData?.getFavoriteProducts() ?? "",
              onTap: () => context.push('/favorites'),
              isData: isData,
            ),
          ],
        );
      },
    );
  }
}
