import 'package:stacked_services/stacked_services.dart';
import 'package:test_commerce/app/app.router.dart';

import '../../app/app.locator.dart';
import '../../data/api/app_repository.dart';
import '../../data/models/product_model.dart';
import '../custom_base_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  final _appRepo = locator<AppRepositoryService>();
  final _navigationService = locator<NavigationService>();
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  Future<void> initialize() async {
    setBusy(true);
    await getProducts();
    setBusy(false);
  }

  Future<void> getProducts() async {
    final response = await _appRepo.getProducts();

    if (response.isSuccessful) {
      _products = response.data;
    }
    notifyListeners();
  }

  void navigateToCategory(String category) {
    _navigationService.navigateToCategoryView(category: category);
  }
}
