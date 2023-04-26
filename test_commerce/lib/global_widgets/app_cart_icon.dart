import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/utilities.dart';

class AppCartIcon extends StatelessWidget {
  final bool isVisible;
  final int count;
  const AppCartIcon({super.key, required this.isVisible, required this.count});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppDimensions.horizontalPadding(context),
        child: Badge(
          isLabelVisible: isVisible,
          // smallSize: 10,
          label: count == 0
              ? null
              : Center(
                  child: Text(
                    '$count',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.regularText10(context)
                        .copyWith(color: AppColors.pureWhite),
                  ),
                ),
          child: InkWell(
            child: SvgPicture.asset('assets/icons/shopping-cart.svg'),
          ),
        ),
      ),
    );
  }
}
