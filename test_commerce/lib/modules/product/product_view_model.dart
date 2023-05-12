import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/app_repository.dart';
import '../../data/models/product_model.dart';

final singleProductProvider =
    AsyncNotifierProviderFamily<ProductNotifier, ProductModel, String>(
        ProductNotifier.new);

class ProductNotifier extends FamilyAsyncNotifier<ProductModel, String> {
  final api = AppRepositoryService();

  Future<ProductModel> _fetchProduct(String productId) async {
    try {
      final response = await api.getSingleProduct(productId);
      final product = ProductModel.fromJson(response.data);
      return product;
    } catch (e) {
      rethrow;
    }
  }

  @override
  FutureOr<ProductModel> build(String arg) {
    return _fetchProduct(arg);
  }
}
