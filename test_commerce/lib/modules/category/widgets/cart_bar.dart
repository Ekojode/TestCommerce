import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../utilities/utilities.dart';
import '../category_view_model.dart';

class CartIcon extends ViewModelWidget<CategoryViewModel> {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, CategoryViewModel viewModel) {
    return Center(
      child: Padding(
        padding: AppDimensions.horizontalPadding(context),
        child: Badge(
          isLabelVisible: !viewModel.cartIsEmpty,
          smallSize: 8,
          //backgroundColor: viewModel.cartIsEmpty ? AppColors.redVelvet : null,
          child: InkWell(
            child: SvgPicture.asset('assets/icons/shopping-cart.svg'),
          ),
        ),
      ),
    );
  }
}
