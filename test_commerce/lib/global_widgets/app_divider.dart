import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: AppDimensions.height(context) * 0.025),
      child: const Divider(
        thickness: 1,
        color: AppColors.softGrey,
      ),
    );
  }
}
