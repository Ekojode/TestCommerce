import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app.locator.dart';
import '../../data/api/app_repository.dart';
import '../../data/models/product_model.dart';
import '../../data/services/cart_service.dart';
import '../../utilities/utilities.dart';
import '../custom_base_model.dart';

class CategoryViewModel extends CustomBaseViewModel {
  final _appRepo = locator<AppRepositoryService>();
  final _cartService = locator<CartService>();

  List<ProductModel> _productsInCategory = [];

  List<ProductModel> get productsInCategory => _productsInCategory;
  bool get cartIsEmpty => _cartService.cart.keys.toList().isEmpty;

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

  void viewProduct(String productId, BuildContext context) {
    context.pushNamed(AppRouter.product, params: {'productId': productId});
  }
}
