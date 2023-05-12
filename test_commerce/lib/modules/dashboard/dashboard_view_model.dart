import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../account/account_view.dart';
import '../home/home_view.dart';
import '../orders/orders_view.dart';
import '../wishlist/wishlist_view.dart';

class DashboardViewModel {
  int _selectedTab = 0;
  static const dashboardPages = [
    HomeView(),
    WishlistView(),
    OrderView(),
    AccountView(),
  ];

  int get selectedTab => _selectedTab;

  void updateSelectedTab(int i) {
    _selectedTab = i;
  }
}

final dashboardProvider = ChangeNotifierProvider<DashboardNotifier>((ref) {
  return DashboardNotifier();
});

class DashboardNotifier extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void updateIndex(i) {
    _pageIndex = i;
    notifyListeners();
  }
}
