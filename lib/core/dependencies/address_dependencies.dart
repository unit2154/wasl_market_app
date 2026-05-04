part of 'locator.dart';

void setupAddressDependencies() {
  getIt.registerFactory<AddressCubit>(
    () => AddressCubit(
      getIt<AddAddressUseCase>(),
      getIt<GetAddressesUseCase>(),
      getIt<DeleteAddressUseCase>(),
      getIt<UpdateAddressUseCase>(),
    ),
  );
  getIt.registerLazySingleton<AddressesRepository>(
    () => AddressesRepoImpl(addressesDataSource: getIt()),
  );
  getIt.registerLazySingleton<AddAddressUseCase>(
    () => AddAddressUseCase(addressRepo: getIt<AddressesRepository>()),
  );
  getIt.registerLazySingleton<GetAddressesUseCase>(
    () => GetAddressesUseCase(addressRepo: getIt<AddressesRepository>()),
  );
  getIt.registerLazySingleton<DeleteAddressUseCase>(
    () => DeleteAddressUseCase(addressRepo: getIt<AddressesRepository>()),
  );
  getIt.registerLazySingleton<UpdateAddressUseCase>(
    () => UpdateAddressUseCase(addressRepo: getIt<AddressesRepository>()),
  );
  getIt.registerLazySingleton<AddressesDataSource>(
    () => AddressesDataSourceImpl(
      apiConsumer: getIt<DioApiConsumer>(),
      tokenBox: getIt<Box<TokenModel>>(),
    ),
  );
}
