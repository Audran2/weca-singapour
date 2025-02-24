import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../widgets/article_card.dart';
import '../widgets/recommended_article_card.dart';

class ArticlesScreen extends StatelessWidget {
  final List<Map<String, String>> recommendations = [
    {
      "image":
          "https://www.nebraskamed.com/sites/default/files/images/primary%20care/superfoods_opengraph.jpg",
      "title": "articles.recommended_articles.articles.one.title".tr()
    },
    {
      "image":
          "https://blog.cdphp.com/wp-content/uploads/2023/09/01-Header-scaled.jpg",
      "title": "articles.recommended_articles.articles.two.title".tr()
    }
  ];

  final List<Map<String, String>> articles = [
    {
      "image":
          "https://img-3.journaldesfemmes.fr/xBIq30XRp74DudzzkNXBn0edhvc=/1500x/smart/512aa8cb861d4a74a8bb819d32271197/ccmcms-jdf/26505505.jpg",
      "title": "articles.classic_articles.articles.one.title".tr(),
      "time": "articles.classic_articles.articles.one.time".tr()
    },
    {
      "image":
          "https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/02/exercising-watch-1296x728-header.jpg?w=1155&h=1528",
      "title": "articles.classic_articles.articles.two.title".tr(),
      "time": "articles.classic_articles.articles.two.time".tr()
    },
    {
      "image":
          "https://studyactive.co.uk/cdn/shop/articles/Muscle_Food_1024x.jpg?v=1705485508",
      "title": "articles.classic_articles.articles.three.title".tr(),
      "time": "articles.classic_articles.articles.three.time".tr()
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
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "articles.title".tr(),
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
              "articles.recommended_articles.label".tr(),
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
