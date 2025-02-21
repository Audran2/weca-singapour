import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/product_history_model.dart';
import '../widgets/dropdown_menu_button.dart';
import '../widgets/history_card.dart';
import 'history_view_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late HistoryViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = HistoryViewModel(context: context);
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
                  padding: EdgeInsets.only(top: widgetHeight * 0.14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _viewModel.isLoading,
                          builder: (context, isLoading, _) {
                            if (isLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            return ValueListenableBuilder<List<ProductHistory>>(
                              valueListenable: _viewModel.historyList,
                              builder: (context, history, _) {
                                if (!isLoading && history.isEmpty) {
                                  return const Center(
                                      child: Text("No history available"));
                                }

                                return ListView.separated(
                                  itemCount: history.length,
                                  itemBuilder: (context, index) {
                                    return HistoryCard(
                                        productHistory: history[index]);
                                  },
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 20),
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
                  'assets/icons/navbar/history.svg',
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
                      "History",
                      style: AppTextStyles.titleText1.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const DropdownMenuButton(),
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
