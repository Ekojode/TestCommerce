import '../../app/app.locator.dart';
import '../models/product_model.dart';

import 'api_provider.dart';
import 'api_response.dart';

class AppRepositoryService {
  final _api = locator<Api>();

  Future<ApiResponse> getProducts() async {
    final response = await _api.get('/products');
    if (response.isSuccessful) {
      response.data = ProductModel.getProductList(response.data);
    }
    return response;
  }

  Future<ApiResponse> getProductsByCategory(String category) async {
    final response = await _api.get('/products/category/$category');
    if (response.isSuccessful) {
      response.data = ProductModel.getProductList(response.data);
    }
    return response;
  }
}
