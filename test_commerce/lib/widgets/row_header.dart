import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class RowHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onPressed;
  const RowHeader(
      {super.key,
      required this.title,
      required this.actionText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.mediumText16(context)
              .copyWith(color: AppColors.textBlack),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              actionText,
              style: AppTextStyle.mediumText12(context)
                  .copyWith(color: AppColors.blueOcean),
            )),
      ],
    );
  }
}
