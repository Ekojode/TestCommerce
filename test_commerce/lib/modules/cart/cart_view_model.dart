import '../../data/models/cart_model.dart';

class CartViewModel {
  final Map<String, CartModel> _cart = {};

  Map<String, CartModel> get cart => _cart;

  bool get cartIsEmpty => cart.keys.toList().isEmpty;
  int get cartCount => cart.keys.toList().length;

  void addItemToCart(
      {required String id, required String name, required String image}) {}

  void removeItemFromCart(String id) {}

  void increaseCartItem(String id) {}

  void decreaseCartItem(String id) {}
}
