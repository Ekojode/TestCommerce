import 'package:flutter/material.dart';

import '../utilities/dimension_utils.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator.adaptive(),
        SizedBox(width: AppDimensions.width(context))
      ],
    );
  }
}
