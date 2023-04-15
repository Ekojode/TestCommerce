// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;
import 'package:test_commerce/modules/account/account_view.dart' as _i3;
import 'package:test_commerce/modules/cart/cart_view.dart' as _i4;
import 'package:test_commerce/modules/category/category_view.dart' as _i8;
import 'package:test_commerce/modules/dashboard/dashboard_view.dart' as _i2;
import 'package:test_commerce/modules/notifications/notifications_view.dart'
    as _i5;
import 'package:test_commerce/modules/orders/orders_view.dart' as _i7;
import 'package:test_commerce/modules/wishlist/wish_list_view.dart' as _i6;

class Routes {
  static const dashboardView = '/dashboard-view';

  static const accountView = '/account-view';

  static const cartView = '/cart-view';

  static const notificationsView = '/notifications-view';

  static const wishListView = '/wish-list-view';

  static const orderView = '/order-view';

  static const categoryView = '/category-view';

  static const all = <String>{
    dashboardView,
    accountView,
    cartView,
    notificationsView,
    wishListView,
    orderView,
    categoryView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i2.DashboardView,
    ),
    _i1.RouteDef(
      Routes.accountView,
      page: _i3.AccountView,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i4.CartView,
    ),
    _i1.RouteDef(
      Routes.notificationsView,
      page: _i5.NotificationsView,
    ),
    _i1.RouteDef(
      Routes.wishListView,
      page: _i6.WishListView,
    ),
    _i1.RouteDef(
      Routes.orderView,
      page: _i7.OrderView,
    ),
    _i1.RouteDef(
      Routes.categoryView,
      page: _i8.CategoryView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.DashboardView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.DashboardView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.AccountView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.AccountView(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.CartView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.CartView(),
        settings: data,
        maintainState: false,
      );
    },
    _i5.NotificationsView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.NotificationsView(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.WishListView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.WishListView(),
        settings: data,
        maintainState: false,
      );
    },
    _i7.OrderView: (data) {
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.OrderView(),
        settings: data,
        maintainState: false,
      );
    },
    _i8.CategoryView: (data) {
      final args = data.getArgs<CategoryViewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.CategoryView(key: args.key, category: args.category),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CategoryViewArguments {
  const CategoryViewArguments({
    this.key,
    required this.category,
  });

  final _i9.Key? key;

  final String category;

  @override
  String toString() {
    return '{"key": "$key", "category": "$category"}';
  }
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWishListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.wishListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.orderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoryView({
    _i9.Key? key,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.categoryView,
        arguments: CategoryViewArguments(key: key, category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWishListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.wishListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrderView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.orderView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCategoryView({
    _i9.Key? key,
    required String category,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.categoryView,
        arguments: CategoryViewArguments(key: key, category: category),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
