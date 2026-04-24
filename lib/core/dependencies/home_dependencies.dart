part of 'locator.dart';

Future<void> homeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getProductsUseCase: getIt<GetProductsUseCase>(),
      getCompaniesUseCase: getIt<GetCompaniesUseCase>(),
      getCategoriesUseCase: getIt<GetCategoriesUseCase>(),
      getBrandsUseCase: getIt<GetBrandsUseCase>(),
      filterItemsUseCase: getIt<FilterItemsUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<GetCompaniesUseCase>(
    () => GetCompaniesUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<GetBrandsUseCase>(
    () => GetBrandsUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<FilterItemsUseCase>(
    () => FilterItemsUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      apiConsumer: getIt<DioApiConsumer>(),
      homeDataSource: getIt<HomeDataSource>(),
    ),
  );
  getIt.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(
      dio: getIt<DioApiConsumer>(),
      tokenBox: getIt<Box<TokenModel>>(),
      userBox: getIt<Box<UserModel>>(),
    ),
  );
  getIt.registerLazySingleton<DioApiConsumer>(
    () => DioApiConsumer(dio: getIt<Dio>()),
  );
}
