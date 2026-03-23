part of 'locator.dart';

Future<void> masterOrdersDependencies() async {
  // ======================= Master Orders =======================
  getIt.registerFactory<MasterOrdersCubit>(
    () => MasterOrdersCubit(
      getMasterOrdersUseCase: getIt<GetMasterOrdersUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetMasterOrdersUseCase>(
    () => GetMasterOrdersUseCase(repo: getIt<MasterOrdersRepo>()),
  );
  getIt.registerLazySingleton<MasterOrdersRepo>(
    () => MasterOrdersRepoImpl(
      masterOrdersDataSource: getIt<MasterOrdersDataSource>(),
    ),
  );
  getIt.registerLazySingleton<MasterOrdersDataSource>(
    () => MasterOrdersDataSourceImpl(
      apiConsumer: getIt<DioApiConsumer>(),
      tokenBox: getIt<Box<TokenModel>>(),
    ),
  );
}
