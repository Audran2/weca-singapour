import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class HomeExploreCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final Color color;
  final Function? onTap;

  const HomeExploreCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Fluttertoast.showToast(
            msg: "Feature not available yet",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.black,
            textColor: AppColors.white,
            fontSize: 16.0,
          );
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.titleText3
                            .copyWith(color: AppColors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: AppTextStyles.bodyText2.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 100),
              ],
            ),
          ),
          Positioned(
            right: -24,
            top: -40,
            child: CustomPaint(
              size: const Size(200, 200),
              painter: DonutPainter(holeColor: color),
            ),
          ),
          Positioned(
            right: 0,
            top: -24,
            child: SizedBox(
              height: 136,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DonutPainter extends CustomPainter {
  final Color holeColor;

  DonutPainter({required this.holeColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double outerRadius = size.width / 2;
    final double innerRadius = size.width / 4;

    final Paint paint = Paint()
      ..color = AppColors.white.withValues(alpha: 0.1)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final Paint holePaint = Paint()
      ..color = holeColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas
      ..drawCircle(center, outerRadius, paint)
      ..drawCircle(center, innerRadius, holePaint);
  }

  @override
  bool shouldRepaint(DonutPainter oldDelegate) {
    return oldDelegate.holeColor != holeColor;
  }
}
