import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget tabletTurned;
  final Widget desktop;

  const ResponsiveLayout({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.tabletTurned,
    required this.desktop,
  }) : super(key: key);

  static int mobileLimit = 640;
  static int tabletLimit = 900;
  static int tabletTurnedLimit = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit &&
      MediaQuery.of(context).size.width >= mobileLimit;

  static bool isTabletTurned(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletTurnedLimit &&
      MediaQuery.of(context).size.width >= tabletLimit;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileLimit) return mobile;

        if (constraints.maxWidth < tabletLimit) return tablet;

        if (constraints.maxWidth < tabletTurnedLimit)
          return tabletTurned;
        else {
          return desktop;
        }
      },
    );
  }
}
