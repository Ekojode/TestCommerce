import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global_widgets/widgets.dart';
import 'dashboard_view_model.dart';
import 'widgets/app_bottom_nav_bar.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBaseView(
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) => IndexedStack(
            index: ref.watch(dashboardProvider).pageIndex,
            children: DashboardViewModel.dashboardPages,
          ),
        ),
        bottomNavigationBar: const AppBottomNavBar(),
      ),
    );
  }
}
