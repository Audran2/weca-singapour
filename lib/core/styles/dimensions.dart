class AppDimensions {
  static const AppRadius radius = AppRadius();

  static const AppPadding padding = AppPadding();
  static const AppMargin margin = AppMargin();

  static const NavbarDimensions navbar = NavbarDimensions();
  static const TopDialogDimensions topDialog = TopDialogDimensions();
  static const ScannerDialog scannerDialog = ScannerDialog();
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

class NavbarDimensions {
  const NavbarDimensions();

  final double navbarRadius = 40.0;
  final double topPadding = 40.0;
  final double bottomPadding = 48.0;
  final double sidePadding = 20.0;
}

class TopDialogDimensions {
  const TopDialogDimensions();

  final double topPosition = 70.0;
  final double sidePaddingFactor = 0.075;
  final double widthFactor = 0.85;
  final double iconSize = 30.0;
}

class ScannerDialog {
  const ScannerDialog();

  final double sidePaddingFactor = 0.075;
  final double widthFactor = 0.85;
}