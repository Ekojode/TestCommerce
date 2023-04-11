import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../modules/account/account_view.dart';
import '../modules/cart/cart_view.dart';
import '../modules/notifications/notifications_view.dart';
import '../modules/orders/orders_view.dart';
import '../modules/wishlist/wish_list_view.dart';
import '../modules/dashboard/dashboard_view.dart';

@StackedApp(
  dependencies: [LazySingleton(classType: NavigationService)],
  routes: [
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: AccountView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: NotificationsView),
    MaterialRoute(page: WishListView),
    MaterialRoute(page: OrderView),
  ],
)
class App {}
