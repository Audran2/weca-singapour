import 'package:flutter/cupertino.dart';

import '../../../styles/colors.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      inactiveTrackColor: ChartColors.secondary100,
      activeTrackColor: ChartColors.secondary300,
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
    );
  }
}