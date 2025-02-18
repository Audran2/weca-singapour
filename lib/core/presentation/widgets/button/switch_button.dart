import 'package:flutter/cupertino.dart';

import '../../../styles/colors.dart';

class SwitchButton extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;

  const SwitchButton({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      inactiveTrackColor: ChartColors.secondary100,
      activeTrackColor: ChartColors.secondary300,
      value: value,
      onChanged: onChanged,
    );
  }
}
