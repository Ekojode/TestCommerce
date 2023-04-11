import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'wish_list_view_model.dart';

class WishListView extends StatelessWidget {
  const WishListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WishlistViewModel>.nonReactive(
      viewModelBuilder: () => WishlistViewModel(),
      builder: (
        BuildContext context,
        WishlistViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'WishListView',
            ),
          ),
        );
      },
    );
  }
}
