import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../data/api/api_provider.dart';
import '../data/api/app_repository.dart';
import '../data/services/cart_service.dart';

@StackedApp(
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: Api),
    LazySingleton(classType: AppRepositoryService),
    LazySingleton(classType: CartService)
  ],
  routes: [],
)
class App {}
