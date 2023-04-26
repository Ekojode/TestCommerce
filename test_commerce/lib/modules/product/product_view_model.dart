import '../../app/app.locator.dart';
import '../../data/api/app_repository.dart';
import '../../data/models/product_model.dart';
import '../cart/cart_view_model.dart';
import '../custom_base_model.dart';

class ProductViewModel extends CustomBaseViewModel {
  final _appRepo = locator<AppRepositoryService>();
  final _cartService = locator<CartViewModel>();

  ProductModel _product = ProductModel();

  ProductModel get product => _product;
  bool get cartIsEmpty => _cartService.cart.keys.toList().isEmpty;
  int get cartCount => _cartService.cart.keys.toList().length;

  void initialise(String productId) async {
    setBusy(true);
    await getProduct(productId);
    setBusy(false);
  }

  Future<void> getProduct(String productId) async {
    final response = await _appRepo.getSingleProduct(productId);
    if (response.isSuccessful) {
      _product = response.data;
    }
    notifyListeners();
  }

  void addProductToCart() {
    _cartService.addItemToCart(
        id: _product.id ?? '',
        name: _product.name ?? '',
        image: _product.image ?? '');
    notifyListeners();
  }
}
