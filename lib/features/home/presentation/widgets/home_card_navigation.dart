import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class HomeCardNavigation extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const HomeCardNavigation({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ChartColors.secondary50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: const BoxDecoration(
                color: ChartColors.primary100,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Icon(
                icon,
                size: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: AppTextStyles.subtitleText3,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTextStyles.subtitleText5,
            ),
          ],
        ),
      ),
    );
  }
}