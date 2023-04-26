import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../../global_widgets/widgets.dart';
import '../product_view_model.dart';

class PCartIcon extends ViewModelWidget<ProductViewModel> {
  const PCartIcon({super.key});

  @override
  Widget build(BuildContext context, ProductViewModel viewModel) {
    return AppCartIcon(
        isVisible: !viewModel.cartIsEmpty, count: viewModel.cartCount);
  }
}
