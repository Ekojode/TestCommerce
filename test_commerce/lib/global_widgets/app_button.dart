import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? bgColor;
  const AppButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.bgColor = AppColors.blueOcean});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: AppDimensions.height(context) * 0.015),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize: Size(AppDimensions.width(context),
                AppDimensions.height(context) * 0.06)),
        child: Text(
          text,
          style: AppTextStyle.mediumText14(context)
              .copyWith(color: AppColors.pureWhite),
        ),
      ),
    );
  }
}
