import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/utilities.dart';

class AppBaseView extends StatelessWidget {
  final Widget child;
  const AppBaseView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: AppColors.pureWhite,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: child);
  }
}
