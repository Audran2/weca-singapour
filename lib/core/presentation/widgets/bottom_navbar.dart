import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../styles/colors.dart';
import '../../styles/dimensions.dart';
import '../../styles/durations.dart';
import '../../styles/shadows.dart';
import '../../styles/text_styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static const List<NavItem> navItems = [
    NavItem(icon: 'assets/icons/navbar/home.svg', route: '/'),
    NavItem(
        icon: 'assets/icons/navbar/notification.svg', route: '/notifications'),
    NavItem(icon: 'assets/icons/navbar/scan.svg', route: '/scan'),
    NavItem(icon: 'assets/icons/navbar/history.svg', route: '/history'),
    NavItem(icon: 'assets/icons/navbar/profile.svg', route: '/profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final int currentIndex =
        navItems.indexWhere((item) => item.route == location);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.navbar.navbarRadius),
          topRight: Radius.circular(AppDimensions.navbar.navbarRadius),
        ),
        boxShadow: [AppShadows.bottomNavShadow],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: AppDimensions.navbar.topPadding,
          bottom: AppDimensions.navbar.bottomPadding,
          left: AppDimensions.navbar.sidePadding,
          right: AppDimensions.navbar.sidePadding,
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
                  top: -AppTextSize.defaultIcon / 2,
                  left: (currentIndex + 0.5) * itemWidth -
                      (AppTextSize.defaultIcon),
                  child: Container(
                    width: AppTextSize.defaultIcon * 2,
                    height: AppTextSize.defaultIcon * 2,
                    decoration: BoxDecoration(
                      color: ChartColors.primary50,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.radius.large),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: navItems.map((item) {
                    final bool isActive = location == item.route;
                    return GestureDetector(
                      onTap: () => item.route == "/scan"
                          ? context.push(item.route)
                          : context.go(item.route),
                      child: Transform.translate(
                        offset: item.route == '/scan'
                            ? const Offset(0, -8)
                            : const Offset(0, 0),
                        child: SizedBox(
                          width: AppTextSize.defaultIcon,
                          height: AppTextSize.defaultIcon,
                          child: SvgPicture.asset(
                            item.icon,
                            colorFilter: ColorFilter.mode(
                              isActive
                                  ? ChartColors.primary500
                                  : AppColors.grey300,
                              BlendMode.srcIn,
                            ),
                          ),
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
  final String icon;
  final String route;

  const NavItem({required this.icon, required this.route});
}
