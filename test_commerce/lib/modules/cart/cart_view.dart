import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cart_view_model.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.nonReactive(
      viewModelBuilder: () => CartViewModel(),
      builder: (
        BuildContext context,
        CartViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'CartView',
            ),
          ),
        );
      },
    );
  }
}
