import 'package:demo_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.primary,
  appBarTheme: AppBarTheme(
      systemOverlayStyle: RouteConfig.darkTop,
      backgroundColor: AppColors.appBarColor),
);
