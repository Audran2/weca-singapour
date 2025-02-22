import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/shadows.dart';
import '../../../../core/styles/text_styles.dart';

class RecommendedArticleCard extends StatelessWidget {
  final Map<String, String> recommendedArticle;

  const RecommendedArticleCard({super.key, required this.recommendedArticle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      width: MediaQuery.of(context).size.width * 0.55,
      height: 300,
      decoration: BoxDecoration(
        boxShadow: [AppShadows.historyCardShadow],
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(recommendedArticle["image"]!),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              AppColors.black,
              AppColors.neutralGrey1.withValues(alpha: 0.25)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            recommendedArticle["title"]!,
            style: AppTextStyles.subtitleText3
                .copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}