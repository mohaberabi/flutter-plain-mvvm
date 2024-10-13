import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/features/cart/model/cart_info.dart';
import 'package:flutter_mvvm/features/cart/model/cart_item.dart';
import 'package:flutter_mvvm/features/cart/model/cart_model.dart';
import 'package:flutter_mvvm/features/cart/model/product_model.dart';
import 'package:flutter_mvvm/features/cart/viewmodel/cart_state.dart';

class CartViewModel extends ChangeNotifier {
  final CartModel _cartModel = CartModel();

  CartViewModel() {
    _cartModel.cartInfoStream.listen(
      (info) {
        _state = _state.copyWith(
            items: info.items,
            isProcessing: false,
            error: null,
            totalItems: info.totalItems,
            totalPrice: info.totalPrice);
        notifyListeners();
      },
    );
  }

  CartState _state = const CartState();

  CartState get state => _state;

  Future<void> addToCart(ProductModel item) async {
    try {
      _state = _state.copyWith(isProcessing: true, error: null);
      notifyListeners();
      await _cartModel.addToCart(item);
      _state = _state.copyWith(isProcessing: false, error: null);
      notifyListeners();
    } catch (e, st) {
      _state = _state.copyWith(isProcessing: false, error: e);
    }
  }

  Future<void> removeFromCart(CartItem item) async {
    try {
      _state = _state.copyWith(isProcessing: true, error: null);
      notifyListeners();
      await _cartModel.removeFromCart(item);
      _state = _state.copyWith(isProcessing: false, error: null);
      notifyListeners();
    } catch (e, st) {
      _state = _state.copyWith(isProcessing: false, error: e);
    }
  }

  void clearError() => _state = _state.copyWith(error: null);

  @override
  void dispose() {
    super.dispose();
    _cartModel.dispose();
  }
}
