import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle AppBar() => const TextStyle(
        color: AppColors.black,
        fontSize: 24,
        fontWeight: FontWeight.w900,
      );

  static TextStyle titleStyle() => const TextStyle(
        color: AppColors.black,
        fontSize: 36,
        fontWeight: FontWeight.w400,
      );

  static TextStyle mainData() => const TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
  static TextStyle quizNumber() => const TextStyle(
        color: AppColors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );
  static TextStyle part2Action() => const TextStyle(
        color: AppColors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );
  static TextStyle splashtitle() => const TextStyle(
        color: AppColors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      );
  static TextStyle tabBarStyle() => const TextStyle(
        color: AppColors.black,
        fontSize: 16,
      );
  static TextStyle carsTitleStyle() => const TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
  static TextStyle carsPriceStyle() => const TextStyle(
        color: AppColors.greyBlack,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
  static TextStyle calculateTitleStyle() => const TextStyle(
        color: AppColors.greyBlack,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      );
}
