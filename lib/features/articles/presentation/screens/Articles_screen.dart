import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../widgets/article_card.dart';
import '../widgets/recommended_article_card.dart';

class ArticlesScreen extends StatelessWidget {
  final List<Map<String, String>> recommendations = [
    {
      "image":
          "https://www.vacationstravel.com/wp-content/uploads/2023/12/Untitled-design-2-5.jpg",
      "title": "The Ultimate Guide to Superfoods: Boost Your Health Naturally"
    },
    {
      "image":
          "https://www.vacationstravel.com/wp-content/uploads/2023/12/Untitled-design-2-5.jpg",
      "title": "Meal Prepping: Healthier You, Save Time and Eat Better"
    }
  ];

  final List<Map<String, String>> articles = [
    {
      "image":
          "https://www.vacationstravel.com/wp-content/uploads/2023/12/Untitled-design-2-5.jpg",
      "title": "Understanding Macronutrients: The Key to a Balanced Diet...",
      "time": "5 min"
    },
    {
      "image":
          "https://www.vacationstravel.com/wp-content/uploads/2023/12/Untitled-design-2-5.jpg",
      "title": "Weight Loss vs. Fat Loss: What’s the Difference and Why...",
      "time": "5 min"
    },
    {
      "image":
          "https://www.vacationstravel.com/wp-content/uploads/2023/12/Untitled-design-2-5.jpg",
      "title": "Best Foods for Muscle Growth and Recovery",
      "time": "5 min"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Our Articles",
              style: AppTextStyles.bodyText1,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Recommendations",
              style:
              AppTextStyles.subtitleText1.copyWith(color: AppColors.black),
            ),
          ),
          const SizedBox(height: 16),
          _buildHorizontalSlider(),
          const SizedBox(height: 32),
          ...articles.map((article) => ArticleCard(article: article)).toList(),
        ],
      ),
    );
  }

  SizedBox _buildHorizontalSlider() {
    return SizedBox(
      height: 304,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 32),
        itemCount: recommendations.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return RecommendedArticleCard(recommendedArticle: recommendations[index]);
        },
      ),
    );
  }
}
