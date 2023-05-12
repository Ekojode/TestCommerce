import 'api_provider.dart';
import 'api_response.dart';

class AppRepositoryService {
  final _api = Api();

  Future<ApiResponse> getProducts() async {
    final response = await _api.get('/products');
    return response;
  }

  Future<ApiResponse> getProductsByCategory(String category) async {
    final response = await _api.get('/products/category/$category');
    return response;
  }

  Future<ApiResponse> getSingleProduct(String productId) async {
    final response = await _api.get('/products/$productId');
    return response;
  }
}
