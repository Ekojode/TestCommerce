import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'account_view_model.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.nonReactive(
      viewModelBuilder: () => AccountViewModel(),
      builder: (
        BuildContext context,
        AccountViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'AccountView',
            ),
          ),
        );
      },
    );
  }
}
