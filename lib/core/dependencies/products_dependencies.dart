part of 'locator.dart';

Future<void> productsDependencies() async {
  getIt.registerFactory<StoreProductsListCubit>(
    () => StoreProductsListCubit(
      getProductsUseCase: getIt<GetStoreProductsUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetStoreProductsUseCase>(
    () => GetStoreProductsUseCase(getIt<StoreProductsRepo>()),
  );
  getIt.registerLazySingleton<StoreProductsRepo>(
    () => StoreProductsRepoImpl(
      productsDataSource: getIt<StoreProductsDataSource>(),
    ),
  );
  getIt.registerLazySingleton<StoreProductsDataSource>(
    () => StoreProductsDataSourceImpl(
      dio: getIt<DioApiConsumer>(),
      tokenBox: getIt<Box<TokenModel>>(),
      userBox: getIt<Box<UserModel>>(),
    ),
  );
}
