import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../data/api/app_repository.dart';
import '../../data/models/product_model.dart';
import '../custom_base_model.dart';

class CategoryViewModel extends CustomBaseViewModel {
  final _appRepo = locator<AppRepositoryService>();
  final _navigationService = locator<NavigationService>();
  List<ProductModel> _productsInCategory = [];

  List<ProductModel> get productsInCategory => _productsInCategory;
  NavigationService get navigationService => _navigationService;

  Future<void> initialize(String category) async {
    setBusy(true);
    await getProductsInCategory(category);
    setBusy(false);
  }

  Future<void> getProductsInCategory(String category) async {
    final response = await _appRepo.getProductsByCategory(category);
    if (response.isSuccessful) {
      _productsInCategory = response.data;
    }
    notifyListeners();
  }
}
