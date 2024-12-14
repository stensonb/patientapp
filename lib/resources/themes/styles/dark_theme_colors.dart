import 'package:flutter/material.dart';
import '/resources/themes/styles/color_styles.dart';

/* Dark Theme Colors
|-------------------------------------------------------------------------- */

class DarkThemeColors implements ColorStyles {
  // general
  @override
  Color get background => const Color.fromARGB(255, 20, 57, 82);

  @override
  Color get content => const Color(0xFFE1E1E1);
  @override
  Color get primaryAccent => const Color(0xffa0baff);

  @override
  Color get surfaceBackground => Colors.white70;
  @override
  Color get surfaceContent => Colors.lightBlue;

  // app bar
  @override
  Color get appBarBackground => const Color.fromARGB(255, 50, 70, 84);
  @override
  Color get appBarPrimaryContent => const Color.fromARGB(121, 255, 255, 255);

  // buttons
  @override
  Color get buttonBackground => const Color(0xffd8d8d8);
  @override
  Color get buttonContent => const Color.fromARGB(221, 177, 18, 18);

  @override
  Color get buttonSecondaryBackground => Colors.grey.shade800;
  @override
  Color get buttonSecondaryContent => Colors.white70;

  // bottom tab bar
  @override
  Color get bottomTabBarBackground => const Color.fromARGB(255, 61, 69, 74);

  // bottom tab bar - icons
  @override
  Color get bottomTabBarIconSelected => Colors.white70;
  @override
  Color get bottomTabBarIconUnselected => Colors.white60;

  // bottom tab bar - label
  @override
  Color get bottomTabBarLabelUnselected => Colors.white54;
  @override
  Color get bottomTabBarLabelSelected => Colors.white;

  // toast notification
  @override
  Color get toastNotificationBackground => const Color(0xff3e4447);
}
