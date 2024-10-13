class CartItem {
  final String id;

  final String name;

  final double price;

  final int qty;

  const CartItem({
    required this.name,
    required this.id,
    required this.price,
    required this.qty,
  });
}
