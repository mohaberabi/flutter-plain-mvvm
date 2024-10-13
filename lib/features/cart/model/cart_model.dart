import 'dart:async';

import 'package:flutter_mvvm/features/cart/model/cart_item.dart';
import 'package:flutter_mvvm/features/cart/model/product_model.dart';

import 'cart_info.dart';

class CartModel {
  final CartInfo _cartInfo = CartInfo(
    items: {},
    totalPrice: 0,
    totalItems: 0,
  );

  final _cartController = StreamController<CartInfo>();

  Stream<CartInfo> get cartInfoStream => _cartController.stream;

  Future<CartInfo> get cartInfoFuture async => _cartInfo;

  CartInfo get cartInfo => _cartInfo;

  Future<void> addToCart(ProductModel item) async {}

  Future<void> removeFromCart(CartItem item) async {}

  void dispose() {
    _cartController.close();
  }
}
