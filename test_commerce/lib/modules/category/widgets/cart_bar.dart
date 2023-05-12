import 'package:flutter/material.dart';

import '../../../global_widgets/widgets.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCartIcon(isVisible: true, count: 6);
  }
}
