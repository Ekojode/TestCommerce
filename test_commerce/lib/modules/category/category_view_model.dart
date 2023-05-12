import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/app_repository.dart';
import '../../data/models/product_model.dart';

final categoryProductsProvider = AsyncNotifierProviderFamily<
    CategoryProductsNotifier,
    List<ProductModel>,
    String>(CategoryProductsNotifier.new);

class CategoryProductsNotifier
    extends FamilyAsyncNotifier<List<ProductModel>, String> {
  final api = AppRepositoryService();

  Future<List<ProductModel>> _fetchProducts(String category) async {
    try {
      final response = await api.getProductsByCategory(category);

      return ProductModel.getProductList(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<List<ProductModel>> build(String arg) async {
    return _fetchProducts(arg);
  }
}
