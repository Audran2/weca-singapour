class AppDimensions {
  static const AppRadius radius = AppRadius();

  static const AppPadding padding = AppPadding();
  static const AppMargin margin = AppMargin();

  static const TopDialogDimensions topDialog = TopDialogDimensions();
}

class AppRadius {
  const AppRadius();

  final double small = 4.0;
  final double medium = 8.0;
  final double large = 12.0;
  final double extraLarge = 16.0;
  final double xxLarge = 20.0;
  final double xxxLarge = 24.0;
}

class AppPadding {
  const AppPadding();

  final double small = 4.0;
  final double medium = 8.0;
  final double large = 12.0;
  final double extraLarge = 16.0;
  final double xxLarge = 20.0;
  final double xxxLarge = 24.0;
}

class AppMargin {
  const AppMargin();

  final double small = 4.0;
  final double medium = 8.0;
  final double large = 12.0;
  final double extraLarge = 16.0;
  final double xxLarge = 20.0;
  final double xxxLarge = 24.0;
}

class TopDialogDimensions {
  const TopDialogDimensions();

  final double topPosition = 70.0;
  final double sidePaddingFactor = 0.025;
  final double widthFactor = 0.95;
  final double iconSize = 30.0;
}