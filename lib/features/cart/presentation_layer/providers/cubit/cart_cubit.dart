import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/cart_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/entities/sub_entity/cart_item_entity.dart';
import 'package:wasl_market_app/features/cart/domain_layer/usecases/add_product_to_cart.dart';
import 'package:wasl_market_app/features/cart/domain_layer/usecases/get_cart.dart';
import 'package:wasl_market_app/features/cart/domain_layer/usecases/remove_product_from_cart.dart';
import 'package:wasl_market_app/features/cart/domain_layer/usecases/update_product_quantitiy.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCart getCartUseCase;
  final AddToCart addToCartUseCase;
  final RemoveFromCart removeFromCartUseCase;
  final UpdateCart updateCartUseCase;
  CartCubit({
    required this.getCartUseCase,
    required this.addToCartUseCase,
    required this.removeFromCartUseCase,
    required this.updateCartUseCase,
  }) : super(CartState());

  Future<void> getCart() async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await getCartUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CartStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (cart) => emit(state.copyWith(status: CartStatus.success, cart: cart)),
    );
  }

  Future<void> addToCart(CartItemEntity product) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await addToCartUseCase(product);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CartStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (cart) => emit(state.copyWith(status: CartStatus.success, cart: cart)),
    );
  }

  Future<void> removeFromCart(CartItemEntity product) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await removeFromCartUseCase(product);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CartStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (cart) => emit(state.copyWith(status: CartStatus.success, cart: cart)),
    );
  }

  Future<void> updateCart(CartItemEntity product, int quantity) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = await updateCartUseCase(product, quantity);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CartStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (cart) => emit(state.copyWith(status: CartStatus.success, cart: cart)),
    );
  }
}
