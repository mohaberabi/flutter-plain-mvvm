import 'package:flutter_mvvm/features/cart/model/cart_item.dart';

class CartState {
  final Map<String, CartItem> items;
  final double totalPrice;
  final int totalItems;
  final bool isProcessing;
  final Object? error;

  const CartState({
    this.items = const {},
    this.totalPrice = 0.0,
    this.totalItems = 0,
    this.isProcessing = false,
    this.error,
  });

  CartState copyWith({
    Map<String, CartItem>? items,
    double? totalPrice,
    int? totalItems,
    bool? isProcessing,
    Object? error,
  }) {
    return CartState(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      totalItems: totalItems ?? this.totalItems,
      isProcessing: isProcessing ?? this.isProcessing,
      error: error,
    );
  }
}
