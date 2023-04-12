import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../global_widgets/widgets.dart';
import 'dashboard_view_model.dart';
import 'widgets/app_bottom_nav_bar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (
        BuildContext context,
        DashboardViewModel viewModel,
        Widget? child,
      ) {
        return AppBaseView(
          child: WillPopScope(
            onWillPop: () async {
              if (viewModel.selectedTab != 0) {
                viewModel.updateSelectedTab(0);
                return false;
              } else {
                return true;
              }
            },
            child: Scaffold(
              body: IndexedStack(
                index: viewModel.selectedTab,
                children: viewModel.dashboardPages,
              ),
              bottomNavigationBar: const AppBottomNavBar(),
            ),
          ),
        );
      },
    );
  }
}
