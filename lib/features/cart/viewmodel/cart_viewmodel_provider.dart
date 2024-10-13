import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/features/cart/viewmodel/cart_viewmodel.dart';

class CartViewModelProvider extends InheritedWidget {
  final CartViewModel cartViewModel;

  const CartViewModelProvider({
    super.key,
    required super.child,
    required this.cartViewModel,
  });

  static CartViewModel of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<CartViewModelProvider>();

    if (provider == null) {
      throw 'No CartProvider found in context';
    }

    return provider.cartViewModel;
  }

  static CartViewModel read(BuildContext context) {
    final provider =
        context.getInheritedWidgetOfExactType<CartViewModelProvider>();

    if (provider == null) {
      throw Exception('No CartViewModelProvider found in context');
    }

    return (provider).cartViewModel;
  }

  @override
  bool updateShouldNotify(CartViewModelProvider oldWidget) {
    return oldWidget.cartViewModel != cartViewModel;
  }
}
