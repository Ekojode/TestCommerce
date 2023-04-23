import 'package:flutter/material.dart';

import '../utilities/utilities.dart';

class AppSpacer extends StatelessWidget {
  final double? multiplier;
  const AppSpacer({super.key, this.multiplier = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height(context) * 0.01 * multiplier!,
    );
  }
}
