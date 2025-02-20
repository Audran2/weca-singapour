import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class DropdownMenuButton extends StatelessWidget {
  const DropdownMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: DropdownButton<String>(
        isDense: true,
        value: 'Option 1',
        icon: SvgPicture.asset(
          'assets/icons/actions/Chevron_Down.svg',
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
        elevation: 1,
        style: AppTextStyles.subtitleText3.copyWith(color: AppColors.white),
        underline: Container(
          height: 1,
          color: Colors.transparent,
        ),
        dropdownColor: AppColors.black.withValues(alpha: 0.05),
        onChanged: (String? newValue) {
          // Handle change
        },
        items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
