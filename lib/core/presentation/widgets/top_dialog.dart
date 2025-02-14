import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/dimensions.dart';
import '../../styles/durations.dart';
import '../../styles/shadows.dart';
import '../../styles/text_styles.dart';

enum TopDialogType {
  ERROR, SUCCESS, INFO, WARNING
}

class TopInfoDialog extends StatefulWidget {
  final TopDialogType dialogType;
  final String message;

  const TopInfoDialog({
    this.dialogType = TopDialogType.INFO,
    required this.message
  });

  @override
  _TopInfoDialogState createState() => _TopInfoDialogState();
}

class _TopInfoDialogState extends State<TopInfoDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppDurations.topDialog.animationDuration,
      reverseDuration: AppDurations.topDialog.animationDuration,
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -2.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
    Future.delayed(AppDurations.topDialog.displayDuration, () {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppDimensions.topDialog.topPosition,
      left: MediaQuery.of(context).size.width * AppDimensions.topDialog.sidePaddingFactor,
      width: MediaQuery.of(context).size.width * AppDimensions.topDialog.widthFactor,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(AppDimensions.padding.extraLarge),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(AppDimensions.radius.large),
              boxShadow: [AppShadows.defaultShadow],
            ),
            child: Row(
              children: [
                _buildIcon(),
                SizedBox(width: AppDimensions.padding.large),
                Expanded(
                  child: Text(
                    widget.message,
                    style: AppTextStyles.bodyText2.copyWith(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Icon _buildIcon() {
    final IconData iconData = {
      TopDialogType.SUCCESS: Icons.check_circle_outline_rounded,
      TopDialogType.ERROR: Icons.error_outline_rounded,
      TopDialogType.WARNING: Icons.warning_amber_outlined,
      TopDialogType.INFO: Icons.info_outline_rounded,
    }[widget.dialogType]!;

    final Color iconColor = {
      TopDialogType.SUCCESS: StatusColors.success,
      TopDialogType.WARNING: StatusColors.warning,
      TopDialogType.ERROR: StatusColors.error,
      TopDialogType.INFO: StatusColors.info,
    }[widget.dialogType]!;

    return Icon(iconData, color: iconColor, size: AppDimensions.topDialog.iconSize);
  }
}