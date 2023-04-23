import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/category/category_view.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/product/product_view.dart';

class AppRouter {
  static const product = 'product';
  static const category = 'category';
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardView();
      },
      routes: <RouteBase>[
        GoRoute(
          name: AppRouter.product,
          path: 'product/:productId',
          builder: (BuildContext context, GoRouterState state) {
            return ProductView(productId: state.params['productId']!);
          },
        ),
        GoRoute(
          name: AppRouter.category,
          path: 'category/:cat',
          builder: (BuildContext context, GoRouterState state) {
            return CategoryView(category: state.params['cat']!);
          },
        ),
      ],
    ),
  ],
);

GoRouter get router => _router;
