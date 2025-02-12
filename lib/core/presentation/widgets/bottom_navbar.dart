import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../styles/colors.dart';
import '../../styles/dimensions.dart';
import '../../styles/durations.dart';
import '../../styles/shadows.dart';
import '../../styles/text_styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static const List<NavItem> navItems = [
    NavItem(icon: Icons.home, route: '/'),
    NavItem(icon: Icons.notifications, route: '/notifications'),
    NavItem(icon: Icons.qr_code_scanner, route: '/scan'),
    NavItem(icon: Icons.access_time, route: '/history'),
    NavItem(icon: Icons.account_box, route: '/profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final int currentIndex = navItems.indexWhere((item) => item.route == location);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radius.navbarRadius),
          topRight: Radius.circular(AppDimensions.radius.navbarRadius),
        ),
        boxShadow: [AppShadows.bottomNavShadow],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: AppDimensions.padding.xxLarge,
          bottom: AppDimensions.navbar.bottomPadding,
          left: AppDimensions.padding.extraLarge,
          right: AppDimensions.padding.extraLarge,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double itemWidth = constraints.maxWidth / navItems.length;

            return Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedPositioned(
                  duration: AppDurations.defaultDuration,
                  curve: Curves.easeInOut,
                  left: currentIndex * itemWidth + (itemWidth - AppDimensions.navbar.navItemSize) / 2,
                  child: Container(
                    width: AppDimensions.navbar.navItemSize,
                    height: AppDimensions.navbar.navItemSize,
                    decoration: BoxDecoration(
                      color: ChartColors.primary50,
                      borderRadius: BorderRadius.circular(AppDimensions.radius.large),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: navItems.map((item) {
                    final bool isActive = location == item.route;
                    return GestureDetector(
                      onTap: () => context.go(item.route),
                      child: SizedBox(
                        width: AppDimensions.navbar.navItemSize,
                        height: AppDimensions.navbar.navItemSize,
                        child: Icon(
                          item.icon,
                          color: isActive ? ChartColors.primary500 : AppColors.grey,
                          size: AppTextSize.headlineMedium,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String route;
  const NavItem({required this.icon, required this.route});
}
