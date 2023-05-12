import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../providers/cart_provider.dart';
import '../utilities/utilities.dart';

class AppCartIcon extends ConsumerWidget {
  const AppCartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartRef = ref.watch(cartProvider);
    return Center(
      child: Padding(
        padding: AppDimensions.horizontalPadding(context),
        child: Badge(
          isLabelVisible: cartRef.isNotEmpty,
          label: cartRef.isEmpty
              ? null
              : Center(
                  child: Text(
                    '${cartRef.length}',
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
