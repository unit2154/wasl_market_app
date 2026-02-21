part of 'cart_cubit.dart';

enum CartStatus {
  loading,
  success,
  failure,
  updateCart,
  clearCart,
  addToCart,
  removeFromCart,
}

@immutable
class CartState {
  final CartStatus status;
  final CartEntity? cart;
  final String errorMessage;
  const CartState({
    this.status = CartStatus.loading,
    this.cart,
    this.errorMessage = '',
  });

  CartState copyWith({
    CartStatus? status,
    CartEntity? cart,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
