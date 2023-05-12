import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/product_model.dart';

import '../../utilities/utilities.dart';

class CategoryViewModel {
  final List<ProductModel> _productsInCategory = [];

  List<ProductModel> get productsInCategory => _productsInCategory;

  Future<void> initialize(String category) async {}

  Future<void> getProductsInCategory(String category) async {}

  void viewProduct(String productId, BuildContext context) {
    context
        .pushNamed(AppRouter.productDetails, params: {'productId': productId});
  }
}
