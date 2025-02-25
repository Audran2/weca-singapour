import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class ShopCardPart extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const ShopCardPart({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final int rowCount = (items.length + 1) ~/ 2;

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: rowCount,
        itemBuilder: (context, rowIndex) {
          final int leftIndex = rowIndex * 2;
          final int rightIndex = leftIndex + 1;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  margin:
                  const EdgeInsets.only(right: 8, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        child: Image.network(
                          items[leftIndex]["image"],
                          width: double.infinity,
                          height: 258,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[leftIndex]["price"],
                              style: AppTextStyles.titleText2,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              items[leftIndex]["title"],
                              style: AppTextStyles.subtitleText4
                                  .copyWith(
                                color: AppColors.neutralGrey3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (rightIndex < items.length)
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 8, bottom: 16),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          child: Image.network(
                            items[rightIndex]["image"],
                            width: double.infinity,
                            height: 202,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[rightIndex]["price"],
                                style: AppTextStyles.titleText2,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                items[rightIndex]["title"],
                                style: AppTextStyles.subtitleText4
                                    .copyWith(
                                  color: AppColors.neutralGrey3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(child: Container()),
            ],
          );
        },
      ),
    );
  }
}