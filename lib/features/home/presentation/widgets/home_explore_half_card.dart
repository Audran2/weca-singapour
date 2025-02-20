import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class HomeExploreHalfCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color primaryColor;
  final Color secondaryColor;

  const HomeExploreHalfCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: AppTextStyles.bodyText3.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
          Positioned(
            right: -20,
            bottom: -30,
            child: CustomPaint(
              size: const Size(125, 100),
              painter: EllipsePainter(color: secondaryColor),
            ),
          ),
          Positioned(
            right: 10,
            bottom: -4,
            child: Image.asset(
              imageUrl,
              height: 80,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}

class EllipsePainter extends CustomPainter {
  final Color color;

  EllipsePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(EllipsePainter oldDelegate) => false;
}
