import 'package:demo_app/common/constants/app_colors.dart';
import 'package:demo_app/common/constants/app_text.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class Button extends StatelessWidget {
  final String text;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Function onPressed;
  final double space;
  final bool enabled;
  final ButtonType type;
  final bool isLoading;

  const Button({
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.borderRadius = 100,
    this.enabled = true,
    this.padding,
    this.space = 20,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: padding ?? const EdgeInsets.all(0),
            child: TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                shadowColor: MaterialStateProperty.all(
                    AppColors.textPrimary.withOpacity(0.4)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (enabled)
                      return type == ButtonType.primary
                          ? AppColors.primary
                          : AppColors.textPrimary;
                    return type == ButtonType.primary
                        ? AppColors.primary.withOpacity(0.75)
                        : AppColors.textPrimary.withOpacity(0.75);
                  },
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
              child: isLoading ? _buildLoader() : _buttonText(context),
              onPressed: () {
                if (enabled && !isLoading) onPressed();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoader() {
    return const Padding(
        padding: EdgeInsets.all(8), child: CircularProgressIndicator());
  }

  Widget _buttonText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: AppText.button.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
