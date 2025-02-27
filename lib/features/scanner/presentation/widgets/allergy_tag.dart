import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/presentation/widgets/button/primary_button.dart';
import '../../../../core/styles/text_styles.dart';
import '../../domain/item_model.dart';

class AllergyTag extends StatelessWidget {
  final Item item;
  final String icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color fontColor;

  const AllergyTag({
    required this.item,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: /* item.description != null */
          true ? () => _showDescriptionModal(context) : null,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: AppTextSize.defaultIcon,
                height: AppTextSize.defaultIcon,
                colorFilter: ColorFilter.mode(
                  iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.name,
            style: AppTextStyles.subtitleText5.copyWith(
              color: fontColor,
            ),
          ),
        ],
      ),
    );
  }

  void _showDescriptionModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(16),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Align(
                      child: Text(
                        item.name,
                        style: AppTextStyles.subtitleText1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(item.description!,
                          style: AppTextStyles.bodyText1
                      ),
                    ),
                    PrimaryButton(
                      label: "Close",
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
