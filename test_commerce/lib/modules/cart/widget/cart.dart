import 'package:flutter/material.dart';

import '../../../global_widgets/widgets.dart';

class NewCartIcon extends StatelessWidget {
  const NewCartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppCartIcon(isVisible: true, count: 9);
  }
}
