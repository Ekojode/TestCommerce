import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/cart_model.dart';
import '../data/models/product_model.dart';

final cartProvider =
    NotifierProvider<CartNotifier, Map<String, CartModel>>(CartNotifier.new);

class CartNotifier extends Notifier<Map<String, CartModel>> {
  @override
  build() {
    return {};
  }

  void addProductToCart(ProductModel product) {
    state = {
      ...state,
      product.id ?? '': CartModel(
        productId: product.id ?? '',
        quantity: 1,
        image: product.image ?? '',
        name: product.name ?? '',
      ),
    };
  }
}
