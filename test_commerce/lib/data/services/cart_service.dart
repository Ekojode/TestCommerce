import '../models/cart_model.dart';

class CartService {
  final Map<String, CartModel> _cart = {};

  Map<String, CartModel> get cart => _cart;

  void addItemToCart(
      {required String id, required String name, required String image}) {
    if (_cart.containsKey(id)) {
    } else {
      _cart.putIfAbsent(
          id,
          () =>
              CartModel(productId: id, quantity: 1, image: image, name: name));
    }
  }

  void removeItemFromCart(String id) {
    _cart.remove(id);
  }

  void increaseCartItem(String id) {
    _cart.update(id, (value) {
      return CartModel(
          productId: value.productId,
          quantity: value.quantity + 1,
          image: value.image,
          name: value.name);
    });
  }

  void decreaseCartItem(String id) {
    _cart.update(id, (value) {
      return CartModel(
          productId: value.productId,
          quantity: value.quantity - 1,
          image: value.image,
          name: value.name);
    });
  }
}
