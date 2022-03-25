import 'package:demo_app/common/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:utopia_widgets/misc/multi_widget.dart';

import 'constants/app_values.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool heroEnabled;

  const AppLogo({this.size = AppValues.logoSize, this.heroEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MultiWidget(
        [
          (child) => Image.asset(AppImages.logo, width: size),
        ],
      ),
    );
  }
}
