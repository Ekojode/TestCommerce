import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../data/api/api_provider.dart';
import '../data/api/app_repository.dart';
import '../modules/account/account_view.dart';
import '../modules/cart/cart_view.dart';
import '../modules/category/category_view.dart';
import '../modules/notifications/notifications_view.dart';
import '../modules/orders/orders_view.dart';
import '../modules/wishlist/wish_list_view.dart';
import '../modules/dashboard/dashboard_view.dart';

@StackedApp(
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: Api),
    LazySingleton(classType: AppRepositoryService)
  ],
  routes: [
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: AccountView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: NotificationsView),
    MaterialRoute(page: WishListView),
    MaterialRoute(page: OrderView),
    MaterialRoute(page: CategoryView)
  ],
)
class App {}
