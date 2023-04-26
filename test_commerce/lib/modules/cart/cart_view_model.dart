import '../custom_base_model.dart';
import '../../data/models/cart_model.dart';

class CartViewModel extends CustomBaseViewModel {
  final Map<String, CartModel> _cart = {};

  Map<String, CartModel> get cart => _cart;

  bool get cartIsEmpty => cart.keys.toList().isEmpty;
  int get cartCount => cart.keys.toList().length;

  void addItemToCart(
      {required String id, required String name, required String image}) {
    if (_cart.containsKey(id)) {
      print(cartCount);
    } else {
      print(cartCount);
      _cart.putIfAbsent(
          id,
          () =>
              CartModel(productId: id, quantity: 1, image: image, name: name));
    }
    notifyListeners();
  }

  void removeItemFromCart(String id) {
    _cart.remove(id);
    notifyListeners();
  }

  void increaseCartItem(String id) {
    _cart.update(id, (value) {
      return CartModel(
          productId: value.productId,
          quantity: value.quantity + 1,
          image: value.image,
          name: value.name);
    });
    notifyListeners();
  }

  void decreaseCartItem(String id) {
    _cart.update(id, (value) {
      return CartModel(
          productId: value.productId,
          quantity: value.quantity - 1,
          image: value.image,
          name: value.name);
    });
    notifyListeners();
  }
}
