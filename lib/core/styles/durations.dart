class AppDurations {
  static const TopDialog topDialog = TopDialog();
  static const NavbarDurations navbar = NavbarDurations();
}

class TopDialog {
  const TopDialog();
  final Duration mainDuration = const Duration(seconds: 3);
  final Duration animationDuration = const Duration(milliseconds: 500);
  final Duration displayDuration = const Duration(milliseconds: 2500);
}

class NavbarDurations {
  const NavbarDurations();
  final Duration animationDuration = const Duration(milliseconds: 300);
}