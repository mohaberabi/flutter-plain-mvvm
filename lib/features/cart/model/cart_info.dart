import 'package:flutter_mvvm/features/cart/model/cart_item.dart';

class CartInfo {
  final Map<String, CartItem> items;
  final double totalPrice;
  final int totalItems;

  CartInfo({
    required this.items,
    required this.totalPrice,
    required this.totalItems,
  });
}
