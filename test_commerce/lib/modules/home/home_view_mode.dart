import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/app_repository.dart';
import '../../data/models/product_model.dart';

final productProvider =
    AsyncNotifierProvider<ProductNotifier, List<ProductModel>>(
        ProductNotifier.new);

class ProductNotifier extends AsyncNotifier<List<ProductModel>> {
  final api = AppRepositoryService();
  Future<List<ProductModel>> _fetchProducts() async {
    try {
      final response = await api.getProducts();

      return ProductModel.getProductList(response.data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  FutureOr<List<ProductModel>> build() async {
    return _fetchProducts();
  }
}
