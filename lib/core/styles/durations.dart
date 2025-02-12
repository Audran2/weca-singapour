class AppDurations {
  static const Duration defaultDuration = Duration(milliseconds: 300);

  static const TopDialog topDialog = TopDialog();
}

class TopDialog {
  const TopDialog();
  final Duration mainDuration = const Duration(seconds: 3);
  final Duration animationDuration = const Duration(milliseconds: 500);
  final Duration displayDuration = const Duration(milliseconds: 2500);
}