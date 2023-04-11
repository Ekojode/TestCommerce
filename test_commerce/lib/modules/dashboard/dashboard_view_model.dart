import 'package:flutter/material.dart';

import '../account/account_view.dart';
import '../custom_base_model.dart';
import '../notifications/notifications_view.dart';
import '../orders/orders_view.dart';
import '../wishlist/wish_list_view.dart';

class DashboardViewModel extends CustomBaseViewModel {
  int _selectedTab = 0;
  final _dashboardPages = const [
    NotificationsView(),
    WishListView(),
    OrderView(),
    AccountView(),
  ];

  int get selectedTab => _selectedTab;
  List<Widget> get dashboardPages => _dashboardPages;

  void updateSelectedTab(int i) {
    _selectedTab = i;
    notifyListeners();
  }
}
