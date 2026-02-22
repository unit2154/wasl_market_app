part of 'locator.dart';

void cartDependencies() {
  getIt.registerFactory<CartCubit>(
    () => CartCubit(
      getCartUseCase: getIt<GetCart>(),
      addToCartUseCase: getIt<AddToCart>(),
      removeFromCartUseCase: getIt<RemoveFromCart>(),
      updateCartUseCase: getIt<UpdateCart>(),
      createNewOrderUseCase: getIt<CreateNewOrder>(),
      clearCartUseCase: getIt<ClearCart>(),
    ),
  );
  getIt.registerLazySingleton<GetCart>(() => GetCart(getIt<CartRepo>()));
  getIt.registerLazySingleton<AddToCart>(() => AddToCart(getIt<CartRepo>()));
  getIt.registerLazySingleton<RemoveFromCart>(
    () => RemoveFromCart(getIt<CartRepo>()),
  );
  getIt.registerLazySingleton<UpdateCart>(() => UpdateCart(getIt<CartRepo>()));
  getIt.registerLazySingleton<CreateNewOrder>(
    () => CreateNewOrder(cartRepo: getIt<CartRepo>()),
  );
  getIt.registerLazySingleton<ClearCart>(
    () => ClearCart(cartRepo: getIt<CartRepo>()),
  );
  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(cartDataSource: getIt<CartDataSource>()),
  );
  getIt.registerLazySingleton<CartDataSource>(
    () => CartDataSourceImpl(
      apiService: getIt<DioApiConsumer>(),
      cartBox: getIt<Box<CartModel>>(),
      tokenBox: getIt<Box<TokenModel>>(),
    ),
  );
}
