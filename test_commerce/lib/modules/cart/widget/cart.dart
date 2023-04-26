import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../global_widgets/widgets.dart';
import '../cart_view_model.dart';

// class NewCartIcon extends ViewModelWidget<CartViewModel> {
//   const NewCartIcon({super.key});

//   @override
//   Widget build(BuildContext context, CartViewModel viewModel) {
//     return AppCartIcon(
//         isVisible: !viewModel.cartIsEmpty, count: viewModel.cartCount);
//   }
// }

class NewCartIcon extends StatelessWidget {
  const NewCartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (
        BuildContext context,
        CartViewModel model,
        Widget? child,
      ) {
        return AppCartIcon(
            isVisible: !model.cartIsEmpty, count: model.cartCount);
      },
    );
  }
}
