import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

// import '../../../utilities/utilities.dart';
import '../../../global_widgets/widgets.dart';
import '../category_view_model.dart';

class CartIcon extends ViewModelWidget<CategoryViewModel> {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, CategoryViewModel viewModel) {
    return AppCartIcon(
        isVisible: !viewModel.cartIsEmpty, count: viewModel.cartCount);
  }
}
