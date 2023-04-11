import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'orders_view_model.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderViewModel>.nonReactive(
      viewModelBuilder: () => OrderViewModel(),
      builder: (
        BuildContext context,
        OrderViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'OrderView',
            ),
          ),
        );
      },
    );
  }
}
