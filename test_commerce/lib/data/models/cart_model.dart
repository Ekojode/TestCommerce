class CartModel {
  final String productId;
  final String image;
  final String name;
  final int quantity;

  CartModel(
      {required this.productId,
      required this.quantity,
      required this.image,
      required this.name});
}
