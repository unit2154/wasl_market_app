part of 'locator.dart';

Future<void> homeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getCompaniesUseCase: getIt<GetCompaniesUseCase>(),
      getCategoriesUseCase: getIt<GetCategoriesUseCase>(),
      getBrandsUseCase: getIt<GetBrandsUseCase>(),
      filterItemsUseCase: getIt<FilterItemsUseCase>(),
      searchSuggestUseCase: getIt<SearchSuggestUseCase>(),
      searchUseCase: getIt<SearchUsecase>(),
    ),
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
  getIt.registerLazySingleton<SearchSuggestUseCase>(
    () => SearchSuggestUseCase(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerLazySingleton<SearchUsecase>(
    () => SearchUsecase(homeRepo: getIt<HomeRepo>()),
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
