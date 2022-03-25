import 'package:demo_app/common/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppText {
  const AppText._();

  static const input = TextStyle();

  static const inputLabel = TextStyle();

  static final inputHint = input.copyWith(color: AppColors.textSecondary);

  static final button = input.copyWith(color: AppColors.textSecondary);
}
