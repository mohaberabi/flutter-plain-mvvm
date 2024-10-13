import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:flutter_mvvm/features/cart/viewmodel/cart_viewmodel_provider.dart';

class CartViewRoot extends StatelessWidget {
  const CartViewRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return CartViewModelProvider(
      cartViewModel: CartViewModel(),
      child: const CartView(),
    );
  }
}

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late final CartViewModel _cartViewModel;

  @override
  void initState() {
    super.initState();
    _cartViewModel = CartViewModelProvider.read(context);
    _cartViewModel.addListener(_onCartViewModelStateChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListenableBuilder(
        listenable: _cartViewModel,
        builder: (context, _) {
          if (_cartViewModel.state.isProcessing) {
            return const CircularProgressIndicator();
          } else {
            return ListView();
          }
        },
      ),
    );
  }

  void _onCartViewModelStateChanged() {
    if (_cartViewModel.state.error != null) {
      _cartViewModel.clearError(); // #5
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to perform this action'),
        ),
      );
    }
  }
}
