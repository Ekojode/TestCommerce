import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/app.locator.dart';
import '../../data/api/app_repository.dart';
import '../../data/models/product_model.dart';
import '../../utilities/utilities.dart';
import '../custom_base_model.dart';

class HomeViewModel extends CustomBaseViewModel {
  final _appRepo = locator<AppRepositoryService>();

  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  void initialize() async {
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

  void navigateToCategory(String category, BuildContext context) {
    context.goNamed(AppRouter.category, params: {'cat': category});
  }

  void viewProduct(String productId, BuildContext context) {
    context.goNamed(AppRouter.product, params: {'productId': productId});
  }
}
