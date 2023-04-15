import '../../app/app.locator.dart';
import '../../data/api/app_repository.dart';
import '../../data/models/product_model.dart';
import '../custom_base_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  final _appRepo = locator<AppRepositoryService>();
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
  }
}
