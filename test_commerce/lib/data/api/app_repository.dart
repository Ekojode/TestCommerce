import 'package:dio/dio.dart';

import 'api_provider.dart';

class AppRepositoryService {
  final _api = Api();

  Future<Response> getProducts() async {
    final response = await _api.get('/products');

    return response;
  }

  Future<Response> getProductsByCategory(String category) async {
    final response = await _api.get('/products/category/$category');
    return response;
  }

  Future<Response> getSingleProduct(String productId) async {
    final response = await _api.get('/products/$productId');
    return response;
  }
}
